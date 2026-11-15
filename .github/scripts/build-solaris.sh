#!/usr/bin/bash
set -euo pipefail

logs=$1
export LC_ALL=C
export PATH="/usr/gnu/bin:/usr/bin:/usr/sbin:$PATH"
export CC=gcc CXX=g++
export CFLAGS='-m64 -O2' CXXFLAGS='-m64 -O2'

{
    cat /etc/release
    uname -a
    isainfo -k
    "$CC" --version
    printf 'CDE checkout: %s\n' "$GITHUB_SHA"
} | tee "$logs/environment.log"

pkg_status=0
timeout 15m pkg install --no-backup-be --accept \
    developer/build/autoconf developer/build/automake \
    developer/build/gnu-make developer/build/libtool developer/build/pkg-config \
    developer/macro/gnu-m4 bison flex \
    image/library/libjpeg library/motif \
    runtime/perl-538 runtime/tcl-8 shell/ksh93 \
    system/extended-system-utilities system/header system/locale/en_us \
    text/gnu-sed web/curl \
    x11/font-utilities x11/header/x11-protocols \
    x11/library/libx11 x11/library/libxau x11/library/libxdmcp \
    x11/library/libxext x11/library/libxinerama x11/library/libxmu \
    x11/library/libxpm x11/library/libxrender x11/library/toolkit/libxt \
    x11/session/sessreg x11/x11-server-utilities \
    2>&1 | tee "$logs/ips.log" || pkg_status=$?
case "$pkg_status" in
    0|4) ;;
    *) exit "$pkg_status" ;;
esac

# Build in guest-local storage so copyback only transfers source and diagnostics.
build_root=$(mktemp -d)
source_dir=$build_root/cde
deps=$build_root/deps
stage=$build_root/stage
cp -R cde "$source_dir"
mkdir -p "$deps/include" "$deps/lib"

trap 'if [[ -f "$source_dir/config.log" ]]; then cp "$source_dir/config.log" "$logs/config.log"; fi' EXIT

fetch_source() {
    local url=$1 hash=$2 archive=$3

    curl -fsSL --retry 3 --max-time 90 -o "$archive" "$url"
    if [[ "$(/usr/bin/digest -a sha256 "$archive")" != "$hash" ]]; then
        printf 'SHA-256 mismatch for %s\n' "$url" >&2
        return 1
    fi
    gzip -dc "$archive" | tar -xf -
}

(
    cd "$build_root"

    # The Solaris release publisher obsoleted OpenSP. CDE uses onsgmls for its help.
    fetch_source \
        https://deb.debian.org/debian/pool/main/o/opensp/opensp_1.5.2.orig.tar.gz \
        334c444c97590a000f20bcef7c1bec63d4e396bae6ba48b3ff49596443c467dd \
        opensp.tar.gz
    cd opensp-1.5.2
    CXXFLAGS="$CXXFLAGS -std=gnu++98" ./configure \
        --prefix="$deps" --disable-doc-build --disable-nls --disable-shared
    gmake -j4
    gmake install
) 2>&1 | tee "$logs/opensp.log"

(
    cd "$build_root"

    # LMDB is required by CDE and is absent from the Solaris release publisher.
    fetch_source \
        https://codeload.github.com/LMDB/lmdb/tar.gz/refs/tags/LMDB_0.9.33 \
        9c352fa9bdad53d920128ac6a62296f2850c7e29862a610d3a72f5f49a1cd7ea \
        lmdb.tar.gz
    cd lmdb-LMDB_0.9.33/libraries/liblmdb
    gmake -j4 XCFLAGS='-m64 -fPIC' liblmdb.a
    cp lmdb.h "$deps/include/"
    cp liblmdb.a "$deps/lib/"
) 2>&1 | tee "$logs/lmdb.log"

export PATH="$deps/bin:$PATH"
export CPPFLAGS="-I$deps/include -I/usr/dt/share/include"
export LDFLAGS="-L$deps/lib"

cd "$source_dir"
./autogen.sh 2>&1 | tee "$logs/cde-autogen.log"
./configure --prefix=/usr/dt 2>&1 | tee "$logs/cde-configure.log"
gmake -j4 2>&1 | tee "$logs/cde-make.log"
gmake install DESTDIR="$stage" 2>&1 | tee "$logs/cde-install.log"

for program in dtwm dtlogin; do
    test -x "$stage/usr/dt/bin/$program"
    file "$stage/usr/dt/bin/$program"
done | tee "$logs/staged-programs.log"
