MAINTAINERCLEANFILES = Makefile.in

# We need to ensure that the jobs here are run in sequence to build up
# the types.xdr file.
.NOTPARALLEL:

SUFFIXES: .ptype .done

# FIXME - dtinfo ones use #include which seems to fail with syntax error...

LOCALDEPFILES = \
        dtfile.done \
        dticon.done \
        dtpad.done \
        dtcm.done \
        dtmail.done \
        dtdbcache.done \
        dtterm.done \
        dtinfo.done \
        dtinfo_start.done

BUILT_SOURCES = types.xdr
CLEANFILES = *.done types.xdr .tt_lock

tttypesdir = $(CDE_DATA_TOP)/appconfig/tttypes
dist_tttypes_DATA = $(BUILT_SOURCES)

types.xdr: $(LOCALDEPFILES)

TT_TYPE_COMP = $(top_builddir)/lib/tt/bin/tt_type_comp/tt_type_comp

# Let the dtinfo ptypes pick up CDE_DATA_TOP / CDE_INSTALLATION_TOP from
# cde_config.h via tt_type_comp's internal cpp pass, so their start
# strings resolve against the configured --with-cde-* layout.
TT_CPP_FLAGS = -I$(top_srcdir)/include

.ptype.done:
	$(RM) $@
	TTPATH=. $(TT_TYPE_COMP) $(TT_CPP_FLAGS) -sd user -m $< && touch $@ ; $(RM) .tt_lock

EXTRA_DIST = dtinfo_start.opnums
