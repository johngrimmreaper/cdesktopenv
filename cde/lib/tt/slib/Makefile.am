MAINTAINERCLEANFILES = Makefile.in

noinst_LIBRARIES = libstt.a

libstt_a_CXXFLAGS = $(TIRPC_DEFINES) -I$(top_srcdir)/lib/tt/lib \
    -DCDE_INSTALLATION_TOP=\"$(CDE_INSTALLATION_TOP)\" \
    -DCDE_DATA_TOP=\"$(CDE_DATA_TOP)\" \
    -DCDE_CONFIGURATION_TOP=\"$(CDE_CONFIGURATION_TOP)\" \
    -DCDE_LOGFILES_TOP=\"$(CDE_LOGFILES_TOP)\"

libstt_a_SOURCES = \
        ce.h \
        ce_err.h \
        mp_ce_attrs.h \
        mp_observer.h \
        mp_observer_utils.h \
        mp_otype.h \
        mp_otype_utils.h \
        mp_ptype.h \
        mp_ptype_utils.h \
        mp_rpc_implement.h \
        mp_rpc_server.h \
        mp_rpc_server_utils.h \
        mp_s_arg.h \
        mp_s_arg_utils.h \
        mp_s_file.h \
        mp_s_file_utils.h \
        mp_s_global.h \
        mp_s_message.h \
        mp_s_message_utils.h \
        mp_s_mp.h \
        mp_s_msg_context.h \
        mp_s_pat_context.h \
        mp_s_pattern.h \
        mp_s_pattern_inlines.h \
        mp_s_pattern_utils.h \
        mp_s_procid.h \
        mp_s_procid_utils.h \
        mp_s_session.h \
        mp_s_session_utils.h \
        mp_s_xdr_functions.h \
        mp_self_procid.h \
        mp_signature.h \
        mp_signature_utils.h \
        mp_typedb.h \
        mp_typedb_utils.h \
        tt_db_server_consts.h \
        tt_isstrerror.h \
        mp_ce_attrs.C mp_observer.C mp_observer_utils.C  \
mp_otype.C              mp_otype_utils.C           mp_ptype.C           \
mp_ptype_utils.C        mp_rpc_implement.C         mp_rpc_server.C      \
mp_rpc_server_utils.C                                                   \
mp_s_file.C             mp_s_file_utils.C                               \
mp_s_message.C          mp_s_message_utils.C       mp_s_mp.C            \
mp_s_pattern.C          mp_s_pattern_utils.C       mp_s_procid.C        \
mp_s_procid_utils.C     mp_s_msg_context.C         mp_s_pat_context.C   \
mp_s_session.C          mp_s_session_prop.C        mp_s_session_utils.C \
mp_s_xdr_functions.C    mp_self_procid.C                                \
mp_signature.C          mp_signature_utils.C       mp_typedb.C          \
mp_typedb_utils.C       tt_isstrerror.C
