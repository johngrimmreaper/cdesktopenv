MAINTAINERCLEANFILES = Makefile.in

TT_VERSION = "CDE Version @CDE_VERSION_MAJOR@.@CDE_VERSION_MINOR@.@CDE_VERSION_MICRO@@CDE_VERSION_DEV@"
TT_VERSION_DEFINE = -DTT_VERSION_STRING=\"$(TT_VERSION)\"

bin_PROGRAMS = ttdbck

ttdbck_LDADD = ../../slib/libstt.a ../../mini_isam/libisam.a @LIBTT@ \
	$(TIRPCLIB) $(XTOOLLIB)

ttdbck_CXXFLAGS = -I$(top_srcdir)/lib/tt/slib -I$(top_srcdir)/lib/tt/lib -I$(top_srcdir)/lib/tt/mini_isam \
		   $(TT_VERSION_DEFINE)

ttdbck_SOURCES = \
        binkey.h \
        dbck.h \
        options.h \
        options_tt.h \
        prop.h \
        spec.h \
        ttdbck.h \
        binkey.C        binkey_utils.C  common.C \
		 options.C       options_tt.C    prop.C \
		 prop_utils.C    spec.C          spec_repair.C \
		 spec_utils.C    ttdbck.C

EXTRA_DIST = \
        admindefines
