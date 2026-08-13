MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = dthelpgen

nodist_bin_SCRIPTS = dthelpgen.dtsh
EXTRA_DIST = dthelpgen.dtsh.in
DISTCLEANFILES = dthelpgen.dtsh

dthelpgen_CPPFLAGS = -DCDE_INSTALLATION_TOP=\"$(CDE_INSTALLATION_TOP)\" \
-DCDE_DATA_TOP=\"$(CDE_DATA_TOP)\" \
		   -DCDE_CONFIGURATION_TOP=\"$(CDE_CONFIGURATION_TOP)\" \
		   -I ../../../lib/DtHelp

dthelpgen_LDADD = $(DTCLIENTLIBS) $(XTOOLLIB)

dthelpgen_SOURCES = helpgen.c
