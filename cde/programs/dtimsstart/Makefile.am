xsessiondir = $(CDE_DATA_TOP)/config/Xsession.d

MAINTAINERCLEANFILES = Makefile.in

bin_PROGRAMS = dtimsstart

dist_xsession_SCRIPTS = 0020.dtims

dtimsstart_CFLAGS = -DNLS \
    -DCDE_INSTALLATION_TOP=\"$(CDE_INSTALLATION_TOP)\" \
    -DCDE_DATA_TOP=\"$(CDE_DATA_TOP)\" \
    -DCDE_CONFIGURATION_TOP=\"$(CDE_CONFIGURATION_TOP)\" \
    -DCDE_LOGFILES_TOP=\"$(CDE_LOGFILES_TOP)\"

dtimsstart_LDADD = $(DTCLIENTLIBS) $(XTOOLLIB)

dtimsstart_SOURCES = action.c env.c file.c main.c remote.c select.c	\
		     start.c util.c win.c ximserr.h ximsfunc.h xims.h	\
		     ximspath.h

BUILT_SOURCES = 0020.dtims
CLEANFILE = $(BUILT_SOURCES)

cfgdir = $(CDE_DATA_TOP)/config/Xsession.d
dist_cfg_DATA = 0020.dtims

imsdir = $(CDE_DATA_TOP)/config/ims
nodist_ims_DATA = conf/start.conf
EXTRA_DIST = conf/start.conf.in
DISTCLEANFILES = conf/start.conf

LOCAL_CPP_DEFINES = -DCDE_INSTALLATION_TOP=$(CDE_INSTALLATION_TOP) \
-DCDE_DATA_TOP=$(CDE_DATA_TOP) \
                    -DCDE_CONFIGURATION_TOP=$(CDE_CONFIGURATION_TOP) \
		    -DKORNSHELL=$(KSH)

0020.dtims: 0020.dtims.src
	$(RM) $@
	$(GENCPP) -P -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

