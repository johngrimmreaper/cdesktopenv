#!/usr/bin/env bash
set -euo pipefail

vm_dir=$(mktemp -d "$RUNNER_TEMP/solaris.XXXXXX")
logs=$PWD/solaris-ci-logs
image_url=https://github.com/anyvm-org/solaris-builder/releases/download/v2.0.8
mkdir -p "$logs"

trap 'if [[ -s "$vm_dir/qemu.pid" ]]; then kill "$(<"$vm_dir/qemu.pid")" || true; fi' EXIT

download() {
    local asset=$1 hash=$2 target=$3

    echo "Downloading $asset" >&2
    curl -fsSL --retry 3 --connect-timeout 20 --max-time 900 \
        -o "$target" "$image_url/$asset"
    printf '%s  %s\n' "$hash" "$target" | sha256sum --check --status
}

test "$(git rev-parse HEAD)" = "$GITHUB_SHA"

# This image's published login key is for the disposable guest's root account.
download solaris-11.4-gcc-host.id_rsa \
    047eb4785e43d8f0a524b362c722dd7c41ea05e894b7a8b6957db2ba63f4e14d \
    "$vm_dir/ssh_key"
chmod 600 "$vm_dir/ssh_key"

# Verify each release part before sending it into the decompressor.
(
    download solaris-11.4-gcc.qcow2.zst \
        26ecb0bdfc5fea836242526ef33d5155c19a8abe60589b12efa2edb2f16882bd \
        "$vm_dir/image.part"
    cat "$vm_dir/image.part"
    download solaris-11.4-gcc.qcow2.zst.1 \
        329f85200e187ae394469a2d9504ddc94b373d9359f41fd9814ca3eb852ce08a \
        "$vm_dir/image.part"
    cat "$vm_dir/image.part"
) | zstd --decompress --sparse --output "$vm_dir/solaris.qcow2"
rm "$vm_dir/image.part"

acceleration=(-accel tcg -cpu max)
if [[ -e /dev/kvm ]]; then
    sudo setfacl -m "u:$(id -un):rw" /dev/kvm
    acceleration=(-accel kvm -cpu host,pmu=off)
fi

qemu-system-x86_64 \
    -machine pc,hpet=off,smm=off,vmport=off,usb=on "${acceleration[@]}" \
    -m 6144 -smp 4 -rtc base=utc,clock=host,driftfix=slew \
    -netdev user,id=net0,net=192.168.122.0/24,host=192.168.122.1,dhcpstart=192.168.122.254,ipv6=off,hostfwd=tcp:127.0.0.1:2223-192.168.122.254:22 \
    -device e1000,netdev=net0 -device virtio-balloon-pci \
    -drive "file=$vm_dir/solaris.qcow2,format=qcow2,if=virtio,discard=unmap,detect-zeroes=unmap" \
    -vga virtio -display none -monitor none -serial "file:$logs/solaris-console.log" \
    -daemonize -pidfile "$vm_dir/qemu.pid" 2>&1 | tee "$logs/qemu.log"

cat > "$vm_dir/ssh_config" <<EOF
Host cde-solaris
    HostName 127.0.0.1
    Port 2223
    User root
    IdentityFile "$vm_dir/ssh_key"
    IdentitiesOnly yes
    BatchMode yes
    StrictHostKeyChecking accept-new
    UserKnownHostsFile "$vm_dir/known_hosts"
    ConnectTimeout 5
    ServerAliveInterval 15
    ServerAliveCountMax 3
EOF
ssh_guest=(ssh -F "$vm_dir/ssh_config" cde-solaris)
rsync_shell="ssh -F '$vm_dir/ssh_config'"

echo 'Waiting for Solaris SSH'
boot_deadline=$((SECONDS + 600))
until "${ssh_guest[@]}" true 2>"$logs/ssh.log"; do
    if (( SECONDS >= boot_deadline )); then
        cat "$logs/ssh.log" >&2
        tail -n 80 "$logs/solaris-console.log" >&2
        exit 1
    fi
    sleep 5
done

"${ssh_guest[@]}" mkdir -p /var/tmp/cde-ci/logs
rsync -a -e "$rsync_shell" cde .github/scripts/build-solaris.sh cde-solaris:/var/tmp/cde-ci/

status=0
"${ssh_guest[@]}" /usr/bin/sh -s "$GITHUB_SHA" <<'SOLARIS_BUILD' || status=$?
set -eu
cd /var/tmp/cde-ci
if [ ! -x /usr/bin/bash ]; then
    pkg install --no-backup-be --accept shell/bash || [ "$?" -eq 4 ]
fi
export GITHUB_SHA=$1
exec /usr/bin/bash ./build-solaris.sh "$PWD/logs"
SOLARIS_BUILD
rsync -a -e "$rsync_shell" cde-solaris:/var/tmp/cde-ci/logs/ "$logs/"
exit "$status"
