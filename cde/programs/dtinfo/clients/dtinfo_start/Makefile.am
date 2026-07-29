MAINTAINERCLEANFILES = Makefile.in

startinstdir = $(CDE_DATA_TOP)/infolib/etc
startinst_PROGRAMS = dtinfo_start

BUILT_SOURCES = dtinfo_start.opnums

dtinfo_start_LDADD = $(DTCLIENTLIBS) $(XTOOLLIB)

dtinfo_start.opnums: $(top_builddir)/programs/tttypes/dtinfo_start.opnums
	$(RM) dtinfo_start.opnums
	$(LN_S) $? $@

dtinfo_start_SOURCES = dtinfo_start.c

EXTRA_DIST = dtinfo_start.msg
