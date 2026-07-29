MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = dthelpview

dthelpview_CFLAGS = -D_BMS

dthelpview_LDADD = $(DTCLIENTLIBS) $(XTOOLLIB)

dthelpview_SOURCES = Main.c ManPage.c Util.c

EXTRA_DIST = Dthelpview

AM_CPPFLAGS = -I$(top_srcdir)/include
