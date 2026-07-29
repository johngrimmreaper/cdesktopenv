MAINTAINERCLEANFILES = Makefile.in

SUBDIRS = il

cfgdir = $(CDE_INSTALLATION_TOP)/config/svc
dist_cfg_DATA = CDE.lcx


lib_LTLIBRARIES = libDtHelp.la

libDtHelp_la_CFLAGS = -I./il -I$(srcdir)/il \
		      -I./jpeg -I$(srcdir)/jpeg \
		      -I../DtSvc/DtUtil2 \
		      -I$(top_srcdir)/lib/DtSvc/DtUtil2 \
		      -I$(top_srcdir)/include \
		      -I$(top_srcdir)/include/Dt \
		      -I$(top_srcdir)/include/DtI \
		      -DDTLIB \
		      -DCDE_INSTALLATION_TOP='"$(CDE_INSTALLATION_TOP)"' \
		      -DCDE_DATA_TOP='"$(CDE_DATA_TOP)"' \
		      -DCDE_CONFIGURATION_TOP='"$(CDE_CONFIGURATION_TOP)"' \
		      @DT_INCDIR@ @DTI_INCDIR@

# Private headers used by libDtHelp
noinst_HEADERS = \
  AccessCCDFI.h \
  AccessCCDFP.h \
  AccessSDLI.h \
  AccessSDLP.h \
  AsciiSpcI.h \
  CCDFUtilI.h \
  CanvasError.h \
  CanvasOsI.h \
  CleanUpI.h \
  CvStringI.h \
  CvtToArrayP.h \
  DestroyI.h \
  FileListUtilsI.h \
  FormatCCDFI.h \
  FormatI.h \
  FormatManI.h \
  FormatSDLI.h \
  FormatUtilI.h \
  GenUtilsP.h \
  GlobSearchI.h \
  GlobSearchP.h \
  GraphicsI.h \
  HelpAccessI.h \
  HelpDialogI.h \
  HelpDialogImageI.h \
  HelpErrorP.h \
  HelpI.h \
  HelpQuickDI.h \
  HelpUtilI.h \
  HelpXlate.h \
  HistoryI.h \
  HyperTextI.h \
  LayoutUtilI.h \
  LinkMgrI.h \
  Lock.h \
  MessagesP.h \
  ObsoleteP.h \
  PathAreaI.h \
  PrintI.h \
  ResizeI.h \
  SDLI.h \
  SelectionI.h \
  StringFuncsI.h \
  UtilSDLI.h \
  VirtFuncsI.h \
  VolSelectI.h \
  XInterfaceI.h \
  jpeg/cdjpeg.h

# Platform data, message sources, and retained support files
EXTRA_DIST = \
  AIX.lcx \
  DtHelp.msg \
  FreeBSD.lcx \
  Linux.lcx \
  NetBSD.lcx \
  OpenBSD.lcx \
  SunOS.lcx \
  comment.txt \
  fmt_tbl.msg \
  jpeg/README \
  mapfile.reorder

libDtHelp_la_LIBADD = $(JPEGLIB) il/libil.la $(LTLIBICONV)

if SOLARIS
libDtHelp_la_LIBADD += -lw -lgen
endif


libDtHelp_la_SOURCES = Actions.c       AsciiSpc.c      Callbacks.c \
		       Destroy.c       Environ_c.c     FileListUtils.c \
		       FileUtils.c     Font.c          Format.c \
		       FormatMan.c     FormatTerm.c    GifUtils.c \
		       GlobSearch.c    Graphics.c      HelpAccess.c \
		       HelpDialog.c    HelpQuickD.c    HelpUtil.c \
		       Helpos.c        History.c       HourGlass.c \
		       HyperText.c     JpegUtils.c     Messages.c \
		       PathArea.c      Print.c         Resize.c \
		       SetList.c       VolSelect.c     XInterface.c \
		       XUICreate.c     XbmUtils.c      Access.c     \
		       AccessCCDF.c    AccessSDL.c     CCDFUtil.c   \
		       CleanUp.c       FontAttr.c      FormatCCDF.c \
		       FormatSDL.c     FormatUtil.c    GenUtils.c   \
		       Obsolete.c      StringFuncs.c   UtilSDL.c    \
		       bufio.c         decompress.c    HelpXlate.c  \
		       Canvas.c        CanvasOs.c      CvString.c \
		       Layout.c        LayoutUtil.c    LinkMgr.c \
		       Selection.c     VirtFuncs.c

# in order to try to keep lib versions the same across platforms, (2.1.0)
if BSD
libDtHelp_la_LDFLAGS = -version-info 2:1:0
else
libDtHelp_la_LDFLAGS = -version-info 3:0:1
endif
