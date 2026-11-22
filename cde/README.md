CDE - The Common Destop Environment
===

In 2012, CDE was opensourced under the terms of the LGPL V2 license by
the Open Group.

You may reuse and redistribute this code under the terms of this
license. See the COPYING file for details.

# Downloading

Downloading this release:

CDE may be downloaded in source form from the Common Desktop
Environment website:

http://sourceforge.net/projects/cdesktopenv/

Or via git:

git clone git://git.code.sf.net/p/cdesktopenv/code CDE

The git repository will always be more up to date than the
downloadable tarballs we make available, so if you have problems,
please try the latest version from git master.

Note also that the master branch may be unstable, so your milage may
vary.

# Compiling

Complete build and installation instructions can be found on the CDE
wiki:

http://sourceforge.net/p/cdesktopenv/wiki/Home/

Please go there and read the appropriate section(s) for your OS (Linux
or FreeBSD/OpenBSD/NetBSD currently) prior to attmpting to build it.

There are a variety of dependencies that must be met, as well as
specific set up steps required to build, especially relating to
localization and locales.

Do not expect to just type 'make' and have it actually work without
meeting the prerequisites and following the correct steps as spelled
out on the wiki.

There are also a lot of other documents and information there that you
might find useful.

Assuming you've met all of the requirements regarding packages needed
for the build, you can follow the standard autoconf method:

```
$ ./autogen.sh
$ ./configure
$ make
$ sudo make install
```

NOTE: BSD users must currently install and use gmake to compile, as
well as specify the location of the TCL libraries and headers.  So
the instructions for them would looke like:

```
$ ./autogen.sh
$ ./configure --with-tcl=/usr/local/lib/tcl8.6 MAKE="gmake"
$ gmake
$ sudo gmake install
```

Of course change to location of your TCL directory as needed for your
system.

## Installing the dtterm terminfo entry

Ordinary installation copies `dtterm.ti` to CDE's configuration directory
(`/usr/dt/config` by default) without running `tic`. If your system already
provides `dtterm`, you can use that entry. For an explicit installation, run
`make install-terminfo` from the top-level build directory. This uses the
compiler's normal destination and may replace an existing entry there.
Installing to a system database requires write access to it. With ncurses,
the compiler may fall back to a personal database if the default is
unwritable.

Set `TIC=/path/to/tic` on the make command line to select the compiler.
For ncurses or the native Solaris or AIX compiler, set `TERMINFO` to
select an alternate database. Use a compiler compatible with the system
that will read the database.

For package staging with ncurses, set both `DESTDIR` and `TERMINFO`. Use
the database path as it will appear on the target system and create its
parent directory below `DESTDIR`. The staged database path must be unused.

```sh
mkdir -p "$pkgdir/usr/share"
make DESTDIR="$pkgdir" TERMINFO=/usr/share/terminfo install-terminfo
```

For other compilers and when updating a staged database that already
exists, use the platform's packaging tools with the installed
`dtterm.ti`. FreeBSD ports can use `USES=terminfo`. For native NetBSD,
compile to a separate file with `tic -o /path/to/dtterm.cdb dtterm.ti`
and consult `terminfo(5)` for how to make that database visible to
applications. NetBSD's `-o` takes a database filename.

# Support

## Mailing list

https://lists.sourceforge.net/lists/listinfo/cdesktopenv-devel

## IRC

There is a CDE IRC channel on irc.libera.chat, channel #cde

## Patches welcome

Please see

https://sourceforge.net/p/cdesktopenv/wiki/Contributing%20to%20CDE/

for information on how to contribute.









