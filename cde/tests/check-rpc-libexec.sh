#!/bin/sh

# Run from the configured build directory after staging the two RPC daemons.
# Generate the Solaris script with make in programs/dtconfig/sun, including
# when the rest of the Solaris integration is excluded from the build.
set -eu

if [ "$#" -ne 3 ]; then
    printf 'Usage: %s DESTDIR BINDIR RPC_DIR\n' "$0" >&2
    exit 2
fi

stage=$1
bindir=$2
rpcdir=$3

fail()
{
    printf '%s\n' "$*" >&2
    exit 1
}

check_line()
{
    grep -Fqx "$1" "$2" || fail "$2: expected $1"
}

for service in cmsd ttdbserver; do
    daemon=rpc.$service
    expected=$rpcdir/$daemon
    test -x "$stage$expected" || fail "Missing staged executable: $stage$expected"
    if [ "$rpcdir" != "$bindir" ]; then
        test ! -e "$stage$bindir/$daemon" || fail "Unexpected staged executable: $stage$bindir/$daemon"
    fi

    template=contrib/xinetd/$service
    server=$(awk '$1 == "server" && $2 == "=" { print $3 }' "$template")
    test "$server" = "$expected" || fail "$template: expected $expected, got $server"
done

check_line "#define CDE_LIBEXEC_DIR \"$rpcdir\"" include/cde_config.h
check_line "daemon=\"$rpcdir/rpc.cmsd &\"" contrib/rc/openbsd/cmsd

dtconfig=programs/dtconfig/sun/dtconfig
check_line "CMSD=$rpcdir/rpc.cmsd" "$dtconfig"
check_line "TTDBSERVER=$rpcdir/rpc.ttdbserver" "$dtconfig"
check_line "CMSD=/usr/openwin/bin/rpc.cmsd" "$dtconfig"
check_line "TTDBSERVERD=/usr/openwin/bin/rpc.ttdbserverd" "$dtconfig"

printf 'Verified RPC daemons and service paths in %s\n' "$rpcdir"
