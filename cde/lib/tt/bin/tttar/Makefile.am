MAINTAINERCLENAFILES = Makefile.in

TT_VERSION = "CDE Version @CDE_VERSION_MAJOR@.@CDE_VERSION_MINOR@.@CDE_VERSION_MICRO@@CDE_VERSION_DEV@"
TT_VERSION_DEFINE = -DTT_VERSION_STRING=\"$(TT_VERSION)\"

bin_PROGRAMS = tttar

tttar_CXXFLAGS = -I$(top_srcdir)/lib/tt/lib $(TT_VERSION_DEFINE)

tttar_LDADD = ../../slib/libstt.a ../../mini_isam/libisam.a \
	$(LIBTT) $(TIRPCLIB) $(XTOOLLIB)

if SOLARIS
tttar_LDADD += -lintl -lsocket -lnsl
endif

tttar_SOURCES = \
        archiver.h \
        tttar_api.h \
        tttar_file.h \
        tttar_file_utils.h \
        tttar_spec.h \
        tttar_spec_map.h \
        tttar_string_map.h \
        tttar_utils.h \
        tttar.C \
		archiver.C \
		tttar_utils.C \
		tttar_api.C \
		tttar_spec.C \
		tttar_file_utils.C \
		tttar_string_map.C

EXTRA_DIST = \
        admindefines \
        tttar_file.C \
        tttar_spec_map.C
