MAINTAINERCLEANFILES = Makefile.in

# Due to the wierd interdepencencies between helptag and parser,
# disable parallel builds here.  This is some really horrible code and
# design - not surprising since it dates to 1989.
.NOTPARALLEL:

HTAG2       = ..
HTAG2SRC    = $(HTAG2)/htag2
SDLPARSERSRC = $(HTAG2)/parser
SDLELTDEFSRC = $(HTAG2)/eltdef
SDLDTDFILE   = $(HTAG2SRC)/sdl.dtd
SDLUTILSRC   = $(HTAG2)/util
SDLBUILDSRC  = $(HTAG2)/build
SDLUTILLIB   = $(HTAG2)/util/libutil.a
SDLIFFILE    = $(HTAG2SRC)/help.if

AM_CPPFLAGS = -DPASS2 -I../parser -I../util -I../eltdef \
	      -I../../include/parser -I../../include/util \
	      -I../../include/eltdef $(DT_INCDIR)

# needed by parser/
noinst_LIBRARIES = libhelptag.a
libhelptag_a_SOURCES = custom.c sdl.c option.c out.c global.c

EXTRA_DIST = \
    delim.bld \
    delim.elt \
    delim.par \
    sdl.dtd \
    sdl.if
