MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = dtpdmd

dtpdmd_CFLAGS = -DCDE_INSTALLATION_TOP=\"$(CDE_INSTALLATION_TOP)\" \
-DCDE_DATA_TOP=\"$(CDE_DATA_TOP)\"

dtpdmd_LDADD = $(DTCLIENTLIBS) $(XTOOLLIB)

dtpdmd_SOURCES = dispatch.c dtpdmd.c mailbox.c manager.c records.c	\
		 nlmsg.c setup.c util.c dtpdmdP.h nlmsg.h

EXTRA_DIST = dtpdmd.msg

AM_CPPFLAGS = -I$(top_srcdir)/include
