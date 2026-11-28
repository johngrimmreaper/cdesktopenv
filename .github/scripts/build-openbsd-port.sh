#!/bin/sh
# Run inside the disposable OpenBSD guest, as the ports builder.
set -eu

job=/home/cde-ci
cd "$job"
mkdir -p diagnostics packages
uname -a
df -h
test "$(uname -sm)" = "OpenBSD amd64"
export PKG_PATH=https://cdn.openbsd.org/pub/OpenBSD/snapshots/packages/amd64/
test "$(sha256 -q cde-source.tar.gz)" = "$(cat source.sha256)"
tar -xzpf ports.tar.gz -C /usr
cd /usr/ports/x11/cde
cp Makefile distinfo "$job/diagnostics/"
for var in FULLPKGNAME PREFIX LIB_DEPENDS CONFIGURE_ARGS; do
    printf '%s=' "$var"
    make show="$var"
done

# Fetch binary dependencies only for preparation. The CDE package itself
# must be produced by make package from the event source below.
make FETCH_PACKAGES= prepare
pkg_info > "$job/diagnostics/installed-packages.txt"
grep '^motif-' "$job/diagnostics/installed-packages.txt"
make extract

work=$(realpath "$(make show=WRKDIR)")
source=$(realpath "$(make show=WRKDIST)")
package=$(make show=PKGFILE)
test -n "$package"
case "$source" in
    "$work"/*) ;;
    *) printf 'Port source is outside its work directory: %s\n' "$source" >&2; exit 1 ;;
esac
test -f "$source/configure.ac"
test ! -e "$package"
owner=$(stat -f '%u:%g' "$source")

# Keep the framework's extraction cookie in WRKDIR. Replace the entire
# distfile tree so files deleted in Git cannot survive into the patch stage.
rm -rf "$source"
mkdir "$source"
tar -xzof "$job/cde-source.tar.gz" -C "$source"
chown -R "$owner" "$source"
test -f "$source/configure.ac"

if make package; then
    test -s "$package"
    for archive in $(make show=PKGFILES); do
        if test -f "$archive"; then cp -p "$archive" "$job/packages/"; fi
    done
    pkg_info -D unsigned -f "$package" > "$job/diagnostics/package-contents.txt"
else
    status=$?
    (cd "$source" && find . -type f \( -name '*.rej' -o -name config.log \) -print0 |
        pax -0 -wz -f "$job/diagnostics/port-failure.tar.gz")
    exit "$status"
fi
