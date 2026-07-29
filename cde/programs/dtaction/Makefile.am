MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = dtaction

dtaction_SOURCES = Main.c

dtaction_LDADD = $(DTCLIENTLIBS) $(XTOOLLIB)

EXTRA_DIST = dtact.msg

AM_CPPFLAGS = -I$(top_srcdir)/include
