#!/bin/sh

tic=$1
destdir=$2
terminfo=$3
source=$4

fail()
{
    printf '%s\n' "install-terminfo: $*" >&2
    exit 1
}

if test -z "$tic" || test "$tic" = : || ! command -v "$tic" >/dev/null 2>&1; then
    fail "tic is unavailable. Install a terminfo compiler or set TIC to its path."
fi

case "$(LC_ALL=C "$tic" -V 2>/dev/null)" in
    ncurses\ *) ncurses=yes ;;
    *) ncurses=no ;;
esac

if test -z "$destdir"; then
    if test "$ncurses" = yes; then
        if test -n "$terminfo"; then
            HOME=/dev/null exec "$tic" -o "$terminfo" "$source"
        fi
    else
        case "$(uname -s)" in
            SunOS|AIX) ;;
            *) fail "unsupported tic. Use the platform's tools to install dtterm.ti." ;;
        esac
    fi
    if test -n "$terminfo"; then
        export TERMINFO="$terminfo"
    else
        unset TERMINFO
    fi
    exec "$tic" "$source"
fi

test "$ncurses" = yes ||
    fail "staging requires ncurses tic. Use the platform's packaging tools for dtterm.ti."
case "$destdir" in
    /*) ;;
    *) fail "DESTDIR must be an absolute path for staging." ;;
esac
case "$terminfo" in
    /*) ;;
    *) fail "set TERMINFO to the absolute database path on the target system." ;;
esac

stage=$(CDPATH= cd -P "$destdir" && pwd -P) ||
    fail "create the DESTDIR staging directory first."
test "$stage" != / || fail "DESTDIR must identify a staging directory below /."

name=${terminfo##*/}
case "$name" in
    ''|.|..) fail "TERMINFO must name a database." ;;
esac
parent=$(CDPATH= cd -P "$stage${terminfo%/*}" && pwd -P) ||
    fail "create the terminfo database's parent directory in DESTDIR first."
case "$parent/" in
    "$stage/"*) ;;
    *) fail "the terminfo database's parent directory is outside DESTDIR." ;;
esac

# Reject pre-existing databases and symlinks, including ncurses's hashed form.
database=$parent/$name
for path in "$database" "$database.db"; do
    if test -e "$path" || test -L "$path"; then
        fail "$path already exists. Use a new database path or the platform's packaging tools."
    fi
done

# Older ncurses can fall back to $HOME/.terminfo even with -o.
TERMINFO="$database" HOME=/dev/null exec "$tic" -o "$database" "$source"
