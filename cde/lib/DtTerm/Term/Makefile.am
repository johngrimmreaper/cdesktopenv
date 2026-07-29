MAINTAINERCLEANFILES = Makefile.in

CLEANFILES = TermLineData.c

noinst_LTLIBRARIES = libTerm.la

# Private headers used by libTerm
noinst_HEADERS = \
  TermAction.h \
  TermBuffer.h \
  TermBufferP.h \
  TermColor.h \
  TermData.h \
  TermEnhance.h \
  TermFunction.h \
  TermFunctionKey.h \
  TermFunctionKeyP.h \
  TermLineData.h \
  TermParseTable.h \
  TermParseTableP.h \
  TermSendEsc.h

# Input used to generate TermLineData.c
EXTRA_DIST = TermLineData.data

libTerm_la_CFLAGS = -I../TermPrim \
                    -I$(srcdir)/../TermPrim \
                    @DT_INCDIR@ \
                    -I$(top_srcdir)/include/Dt

$(top_builddir)/lib/DtTerm/util/lineToData:
	$(MAKE) -C $(top_builddir)/lib/DtTerm/util lineToData

TermLineData.c: $(srcdir)/TermLineData.data $(top_builddir)/lib/DtTerm/util/lineToData
	$(RM) $@
	$(top_builddir)/lib/DtTerm/util/lineToData -p _DtTerm -f $(srcdir)/TermLineData.data > $@

includes:: TermLineData.c

libTerm_la_SOURCES = \
        Term.c \
        TermAction.c \
        TermBuffer.c \
        TermColor.c \
        TermEnhance.c \
        TermFunction.c \
        TermFunctionKey.c \
        TermLineData.c \
        TermParse.c \
        TermParseTable.c \
        TermVersion.c

