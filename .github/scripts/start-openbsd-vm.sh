#!/usr/bin/env bash
# Boot the snapshot installer via PXE, then boot the installed disk for the port build.
set -euo pipefail
job=$RUNNER_TEMP/openbsd-ci
vm=$job/vm
public=$vm/public
sets=$public/pub/OpenBSD/snapshots/amd64
tftp=$vm/tftp
logs=$job/diagnostics
mkdir -p "$sets" "$tftp/etc" "$logs"

# Base signing keys for the current and next releases, from OpenBSD src/etc/signify.
cat > "$vm/openbsd-80-base.pub" <<'KEY'
untrusted comment: openbsd 8.0 base public key
RWSMSt0erHTctUxq2JDAgQRo64ztikp8JvQeiSPte3NZ0Geou0TkTEiE
KEY
cat > "$vm/openbsd-81-base.pub" <<'KEY'
untrusted comment: openbsd 8.1 base public key
RWQirufSCy10G6Y9Ou9ao2R9RbhzN6E+2hgB6n0Cbj3Eq1aEssZaeHJu
KEY
snapshot="$OPENBSD_SNAPSHOT_URL/amd64"
(
    cd "$sets"
    curl --fail --location --silent --show-error --retry 3 \
        "$snapshot/SHA256.sig" -o SHA256.sig
    verified_key=
    for key in "$vm"/openbsd-*-base.pub; do
        if signify-openbsd -Veq -p "$key" -x SHA256.sig -m SHA256; then
            verified_key=$key
            break
        fi
    done
    if [[ -z "$verified_key" ]]; then
        echo 'OpenBSD snapshot signature does not match a trusted base key.' >&2
        exit 1
    fi

    # Derive the set suffix from the verified manifest to follow release transitions.
    version=$(sed -nE 's/^SHA256 \(base([0-9]+)\.tgz\) = [0-9a-f]{64}$/\1/p' SHA256)
    if [[ ! "$version" =~ ^[0-9]+$ ]]; then
        echo 'Expected one base set in the signed OpenBSD snapshot manifest.' >&2
        exit 1
    fi
    files=(BUILDINFO pxeboot bsd.rd bsd bsd.mp)
    for set in base comp man game xbase xfont xserv xshare; do
        files+=("$set$version.tgz")
    done
    urls=()
    for file in "${files[@]}"; do
        urls+=("$snapshot/$file")
    done
    curl --fail --location --silent --show-error --parallel --parallel-max 4 \
        --remote-name-all --retry 3 "${urls[@]}"
    signify-openbsd -Cp "$verified_key" -x SHA256.sig "${files[@]}"
    cp BUILDINFO "$logs/snapshot-buildinfo.txt"
)
cp "$sets/pxeboot" "$tftp/auto_install"
cp "$sets/bsd.rd" "$tftp/bsd.rd"
printf '%s\n' 'stty com0 115200' 'set tty com0' 'boot tftp:/bsd.rd' > "$tftp/etc/boot.conf"

ssh-keygen -q -t ed25519 -N '' -f "$vm/key"
cat > "$public/install.conf" <<EOF
System hostname = cde-openbsd
IPv4 address for = autoconf
IPv6 address for = none
Password for root = *************
Public ssh key for root account = $(cat "$vm/key.pub")
Start sshd = yes
Allow root ssh login = prohibit-password
Setup a user = no
Change the default console to com0 = yes
Which speed should com0 use = 115200
What timezone are you in = UTC
Which disk is the root disk = sd0
Encrypt the root disk = no
Use (W)hole disk MBR = w
URL to autopartitioning template for disklabel = http://10.0.2.2/disklabel
Location of sets = http
HTTP Server = 10.0.2.2
Unable to connect using https. Use http instead = yes
Server directory = pub/OpenBSD/snapshots/amd64
EOF
# Give the ports tree, objects and packages room on the same filesystem.
printf '%s\n' '/ 2G-* 95%' 'swap 256M-512M 5%' > "$public/disklabel"
(
    exec sudo sh -c 'echo $$ > "$1"; exec python3 -m http.server 80 --bind 127.0.0.1 --directory "$2"' \
        sh "$vm/http.pid" "$public"
) > "$logs/installer-http.log" 2>&1 &
trap 'if [[ -s "$vm/http.pid" ]]; then sudo kill "$(cat "$vm/http.pid")" 2>/dev/null || true; fi' EXIT
for ((n=0; n<10; n++)); do
    if curl -fsS http://127.0.0.1/install.conf -o "$vm/served.conf" 2>/dev/null &&
        cmp -s "$vm/served.conf" "$public/install.conf"; then break; fi
    sleep 1
done
cmp "$vm/served.conf" "$public/install.conf"

accel=(-accel tcg -cpu max)
if [[ -c /dev/kvm ]]; then
    if [[ ! -w /dev/kvm ]]; then sudo setfacl -m "u:$(id -un):rw" /dev/kvm; fi
    accel=(-accel kvm -cpu host)
fi
qemu-img create -q -f qcow2 "$vm/openbsd.qcow2" 18G
qemu-system-x86_64 "${accel[@]}" -smp 2 -m 3072 \
    -drive "file=$vm/openbsd.qcow2,format=qcow2,if=virtio" \
    -boot order=c,once=n -device e1000,netdev=net0 \
    -netdev "user,id=net0,ipv6=off,tftp=$tftp,bootfile=auto_install,hostfwd=tcp:127.0.0.1:2224-:22" \
    -display none -monitor none -serial "file:$logs/console.log" \
    -daemonize -pidfile "$vm/qemu.pid"
cat > "$job/ssh_config" <<EOF
Host openbsd
    HostName 127.0.0.1
    Port 2224
    User root
    IdentityFile "$vm/key"
    IdentitiesOnly yes
    BatchMode yes
    ConnectTimeout 3
    StrictHostKeyChecking accept-new
    UserKnownHostsFile "$vm/known_hosts"
    ServerAliveInterval 15
    ServerAliveCountMax 4
EOF

echo 'Waiting for OpenBSD autoinstall and its first boot'
deadline=$((SECONDS + 900))
until ssh -F "$job/ssh_config" openbsd true 2> "$logs/ssh.log"; do
    if (( SECONDS >= deadline )) || ! kill -0 "$(cat "$vm/qemu.pid")" ||
        grep -Fq 'failed; check /tmp/ai/ai.log' "$logs/console.log"; then
        tail -80 "$logs/console.log" >&2
        exit 1
    fi
    sleep 5
done
# Use the public OpenBSD mirror after installation from the loopback server.
ssh -F "$job/ssh_config" openbsd 'echo https://cdn.openbsd.org/pub/OpenBSD > /etc/installurl; uname -a'
