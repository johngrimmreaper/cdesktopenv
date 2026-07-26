MAINTAINERCLEANFILES = Makefile.in

TT_VERSION = "CDE Version @CDE_VERSION_MAJOR@.@CDE_VERSION_MINOR@.@CDE_VERSION_MICRO@@CDE_VERSION_DEV@"
TT_VERSION_DEFINE = -DTT_VERSION_STRING=\"$(TT_VERSION)\"

noinst_LTLIBRARIES = libutil.la

libutil_la_CXXFLAGS = $(TT_VERSION_DEFINE) -I$(top_srcdir)/lib/tt/lib

libutil_la_SOURCES = \
        copyright.h \
        frozen.tt_trace.tab.h \
        tt_Xlib.h \
        tt_assert.h \
        tt_audit.h \
        tt_base64.h \
        tt_entry_pt.h \
        tt_entry_pt_names.h \
        tt_enumname.h \
        tt_file_system.h \
        tt_file_system_entry.h \
        tt_file_system_entry_utils.h \
        tt_generic.h \
        tt_gettext.h \
        tt_gettext_c.h \
        tt_global_env.h \
        tt_host.h \
        tt_host_equiv.h \
        tt_host_utils.h \
        tt_int_rec.h \
        tt_iostream.h \
        tt_ldpath.h \
        tt_list.h \
        tt_log.h \
        tt_map_entry.h \
        tt_map_entry_utils.h \
        tt_new.h \
        tt_new_ptr.h \
        tt_nl_types.h \
        tt_object.h \
        tt_object_list.h \
        tt_object_table.h \
        tt_path.h \
        tt_port.h \
        tt_ptr.h \
        tt_rpc_auth.h \
        tt_rpc_clnt.h \
        tt_rpc_epilogue.h \
        tt_rpc_prologue.h \
        tt_rpc_svc.h \
        tt_rpc_xdr.h \
        tt_string.h \
        tt_string_map.h \
        tt_string_map_utils.h \
        tt_table.h \
        tt_threadspecific.h \
        tt_trace.h \
        tt_trace_parse.h \
        tt_trace_parser.h \
        tt_trace_stream.h \
        tt_xdr_utils.h \
        tt_xdr_version.h \
        copyright.C	    tt_map_entry_utils.C \
	tt_Xlib.C			    tt_new.C \
	tt_audit.C			    tt_new_ptr.C \
	tt_base64.C			    tt_object.C \
	tt_enumname.C			    tt_object_list.C \
	tt_file_system.C		    tt_object_table.C \
	tt_file_system_entry_utils.C	    tt_path.C \
	tt_gettext.C			    tt_port.C \
	tt_global_env.C 		    tt_string.C \
	tt_host.C			    tt_string_map.C \
	tt_host_equiv.C 		    tt_string_map_utils.C \
	tt_host_equiv_utils.C		    tt_string_match.C \
	tt_host_utils.C 		    tt_threadspecific.C \
	tt_int_rec.C			    tt_trace.C \
	tt_iostream.C			    tt_trace_parser.C \
	tt_ldpath.C			    tt_trace_stream.C \
	tt_log.C			    tt_tracefile_parse.C \
	tt_map_entry.C			    tt_xdr_utils.C \
	tt_entry_pt.C

