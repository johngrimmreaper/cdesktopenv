MAINTAINERCLEANFILES = Makefile.in

SUBDIRS = api db mp util tttk

EXTRA_DIST = \
        dm/dm_enums.h \
        dm/dm_recfmts.h

lib_LTLIBRARIES = libtt.la

libtt_la_SOURCES = \
        tt_const.h \
        tt_options.h

# fake things so libtool creates this as a C++ library
nodist_EXTRA_libtt_la_SOURCES = dummy.cxx

dummy.cxx:
	: > $@

BUILT_SOURCES = dummy.cxx
CLEANFILES = dummy.cxx
libtt_la_LIBADD = api/c/libapi.la api/dnd/libdnd.la db/libdb.la mp/libmp.la \
		  util/libutil.la tttk/libtttk.la

if SOLARIS
# This stuff should be figured out by configure
libtt_la_LIBADD += -lnsl -lsocket -lintl -lw
endif

if LINUX
libtt_la_LIBADD += $(TIRPCLIB)
endif

# in order to try to keep lib versions the same across platforms, (2.1.0)
if BSD
libtt_la_LDFLAGS = -version-info 2:1:0
else
libtt_la_LDFLAGS = -version-info 3:0:1
endif

