MAINTAINERCLEANFILES = Makefile.in

TT_VERSION = "CDE Version @CDE_VERSION_MAJOR@.@CDE_VERSION_MINOR@.@CDE_VERSION_MICRO@@CDE_VERSION_DEV@"
TT_VERSION_DEFINE = -DTT_VERSION_STRING=\"$(TT_VERSION)\"

noinst_LTLIBRARIES = libtttk.la

libtttk_la_CXXFLAGS = $(TT_VERSION_DEFINE) -I$(top_srcdir)/lib/tt/lib

libtttk_la_SOURCES = \
        eclipse.h \
        ttdesktop.h \
        ttdtprocid.h \
        tttk2free.h \
        tttkmessage.h \
        tttkpattern.h \
        tttkutils.h \
        ttdesktop.C     ttdtfile.C      ttdtprocid.C \
	             ttmedia.C       tttk.C          tttk2free.C \
		     tttkmessage.C   tttkpattern.C   tttkutils.C
