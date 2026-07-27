MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = tttrace

tttrace_CXXFLAGS = -I$(top_srcdir)/lib/tt/lib

tttrace_LDADD = $(LIBTT) $(TIRPCLIB) $(XTOOLLIB)

if SOLARIS
tttrace_LDADD += -lintl -lsocket -lnsl
endif

tttrace_SOURCES = \
        tttrace_objs.h \
        tttrace.C tttrace_objs.C

EXTRA_DIST = \
        admindefines
