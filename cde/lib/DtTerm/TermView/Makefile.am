MAINTAINERCLEANFILES = Makefile.in

noinst_LTLIBRARIES = libTermView.la

# Private headers used by libTermView
noinst_HEADERS = \
  TermView.h \
  TermViewGlobalDialog.h \
  TermViewHelp.h \
  TermViewMenu.h \
  TermViewP.h \
  TermViewTerminalDialog.h

libTermView_la_CFLAGS = -I../TermPrim \
                        -I$(srcdir)/../TermPrim \
                        -I../Term \
                        -I$(srcdir)/../Term \
                        @DT_INCDIR@ \
                        -I$(top_srcdir)/include \
                        -I$(top_srcdir)/include/Dt

libTermView_la_SOURCES = TermView.c \
			 TermViewMenu.c \
			 TermViewGlobalDialog.c \
			 TermViewTerminalDialog.c
