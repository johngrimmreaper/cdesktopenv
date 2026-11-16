MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = dtsearchpath

dtsearchpath_CPPFLAGS = -I../libCliSrv $(DT_INCDIR) \
    -DCDE_INSTALLATION_TOP=\"$(CDE_INSTALLATION_TOP)\" \
    -DCDE_DATA_TOP=\"$(CDE_DATA_TOP)\" \
    -DCDE_CONFIGURATION_TOP=\"$(CDE_CONFIGURATION_TOP)\" \
    -DCDE_LOGFILES_TOP=\"$(CDE_LOGFILES_TOP)\"

dtsearchpath_LDADD = ../libCliSrv/libCliSrv.a $(DTCLIENTLIBS) $(XTOOLLIB)

if SOLARIS
dtsearchpath_CPPFLAGS += -DIOSTREAMSWORKS
dtsearchpath_LDADD += -lintl -ladm
endif

dtsearchpath_SOURCES = AppSearchPath.C DbSearchPath.C			\
		       HelpSearchPath.C IconSearchPath.C		\
		       InfoLibSearchPath.C ManSearchPath.C Options.C	\
		       SearchPath.C dtsearchpath.C Options.h		\
		       SearchPath.h
