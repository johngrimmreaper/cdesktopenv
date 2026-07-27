MAINTAINERCLEANFILES = Makefile.in

TT_VERSION = "CDE Version @CDE_VERSION_MAJOR@.@CDE_VERSION_MINOR@.@CDE_VERSION_MICRO@@CDE_VERSION_DEV@"
TT_VERSION_DEFINE = -DTT_VERSION_STRING=\"$(TT_VERSION)\"

BUILT_SOURCES = mp_types_gram.h
CLEANFILES = mp_types_gram.h

mp_types_gram.h: $(srcdir)/frozen.mp_types_gram.h
	$(RM) $@
	$(LN_S) $(srcdir)/frozen.mp_types_gram.h $@

bin_PROGRAMS = tt_type_comp

tt_type_comp_CXXFLAGS = -I$(top_srcdir)/lib/tt/lib -I$(top_srcdir)/lib/tt/slib \
			$(TT_VERSION_DEFINE) -DCPP_PROGRAM="\"$(CPP_PROGRAM)\""

tt_type_comp_SOURCES = \
        mp_types_table.h \
        mp_type_comp.C        mp_types_table.C \
		frozen.mp_types_lex.C frozen.mp_types_gram.C

tt_type_comp_LDADD = ../../slib/libstt.a $(LIBTT) $(TIRPCLIB) $(XTOOLLIB)

if SOLARIS
tt_type_comp_LDADD += $(XTOOLLIB) -lintl -lsocket -lnsl
endif

frozen.mp_types_lex.o: frozen.mp_types_gram.h

EXTRA_DIST = \
        admindefines \
        frozen.mp_types_gram.h \
        mp_types_gram.y \
        mp_types_lex.l
