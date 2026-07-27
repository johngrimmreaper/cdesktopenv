MAINTAINERCLEANFILES = Makefile.in

noinst_LTLIBRARIES = libil.la

libil_la_CFLAGS = -I.. -I$(top_srcdir)/include -I$(top_srcdir)/include/DtI -DDTLIB -DCDE_INSTALLATION_TOP='"$(CDE_INSTALLATION_TOP)"' \
-DCDE_DATA_TOP='"$(CDE_DATA_TOP)"' \
		  -DCDE_CONFIGURATION_TOP='"$(CDE_CONFIGURATION_TOP)"' \
		  @DT_INCDIR@ @DTI_INCDIR@

libil_la_SOURCES = ilX.c                ilbigray.c           ilcodec.c \
		   ilcontext.c          ilconvert.c          ilcrop.c \
		   ildata.c             ildecompg3.c         ildecompg4.c \
		   ildecompjpeg.c       ildecomplzw.c        ildecomppackbits.c \
		   ildecompress.c       ildither.c           ilformat.c \
		   ilgraybi.c           ilimage.c            ilinvert.c \
		   iljpgdecode.c        iljpgdecodejif.c     iljpgdedct.c \
		   iljpgdehuff.c        iljpgutil.c          ilmap.c \
		   ilobject.c           ilpalette.c          ilpipe.c \
		   ilrwimage.c          ilscale.c            ilscalesample.c \
		   iltiff.c             iltiffread.c         iltruegray.c \
		   ilupsample.c         ilutiljpeg.c         ilycbcr.c

# Private headers used by the internal image library
noinst_HEADERS = \
  il.h \
  ilX.h \
  ilXint.h \
  ilcodec.h \
  ilcompress.h \
  ilcontext.h \
  ilconvert.h \
  ildecomp.h \
  ildecompg4.h \
  ildecompg4table.h \
  ilefs.h \
  ilefstiff.h \
  ilerrors.h \
  ilfile.h \
  ilhplrotation.h \
  ilimage.h \
  ilint.h \
  iljpg.h \
  iljpgdecode.h \
  iljpgdecodedefs.h \
  iljpgdecodeint.h \
  iljpgencode.h \
  iljpgencodedefs.h \
  iljpgencodeint.h \
  iljpgint.h \
  ilpipeint.h \
  ilpipelem.h \
  ilscaleint.h \
  iltiffint.h \
  ilutiljpeg.h

# Retained image-library sources not built by libil
EXTRA_DIST = \
  ilXycbcr.c \
  ilcompg3g4.c \
  ilcomplzw.c \
  ilcomppackbits.c \
  ilcompress.c \
  ilcompressjpeg.c \
  ilefs.c \
  ilhplrotate.c \
  ilhplrotation.c \
  iljpgencode.c \
  iljpgencodedata.c \
  iljpgencodejif.c \
  iljpgendct.c \
  iljpgenhuff.c \
  ilmirror.c \
  ilreadX.c \
  ilreadimage.c \
  ilrotate.c \
  iltapfeed.c \
  iltiffwrite.c \
  ilversion.c \
  ilwriteimage.c
