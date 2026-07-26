MAINTAINERCLEANFILES = Makefile.in

noinst_LTLIBRARIES = libdb.la

libdb_la_CXXFLAGS = -I$(top_srcdir)/lib/tt/lib -I$(top_srcdir)/lib/tt/mini_isam

libdb_la_SOURCES = \
        db_server.h \
        tt_client_isam.h \
        tt_client_isam_file.h \
        tt_client_isam_file_utils.h \
        tt_client_isam_key_descriptor.h \
        tt_client_isam_key_descriptor_utils.h \
        tt_client_isam_record.h \
        tt_client_isam_record_utils.h \
        tt_db_access.h \
        tt_db_access_utils.h \
        tt_db_client.h \
        tt_db_client_consts.h \
        tt_db_client_utils.h \
        tt_db_create_objid.h \
        tt_db_file.h \
        tt_db_file_utils.h \
        tt_db_hostname_global_map_ref.h \
        tt_db_hostname_redirection_map.h \
        tt_db_key.h \
        tt_db_key_utils.h \
        tt_db_network_path.h \
        tt_db_object.h \
        tt_db_object_utils.h \
        tt_db_objid_to_key.h \
        tt_db_property.h \
        tt_db_property_utils.h \
        tt_db_results.h \
        tt_db_rpc_message_routines.h \
        tt_db_rpc_routines.h \
        tt_old_db.h \
        tt_old_db_consts.h \
        tt_old_db_message_info.h \
        tt_old_db_message_info_utils.h \
        tt_old_db_partition_map_ref.h \
        tt_old_db_results.h \
        tt_old_db_utils.h \
        db_server_clnt.C           db_server_xdr.C \
        old_db_server_functions.C             tt_client_isam_file.C \
        tt_client_isam_file_utils.C           tt_client_isam_key_descriptor.C \
        tt_client_isam_key_descriptor_utils.C tt_client_isam_record.C \
        tt_client_isam_record_utils.C         tt_db_access_utils.C \
        tt_db_client.C                        tt_db_client_utils.C \
        tt_db_create_objid.C                  tt_db_file.C \
        tt_db_file_utils.C                    tt_db_hostname_global_map_ref.C \
        tt_db_hostname_redirection_map.C      tt_db_key.C \
        tt_db_key_utils.C                     tt_db_network_path.C \
        tt_db_object.C                        tt_db_object_utils.C \
        tt_db_objid_to_key.C                  tt_db_property.C \
        tt_db_property_utils.C                tt_db_rpc_message_routines.C \
        tt_db_rpc_routines.C                  tt_old_db.C \
	tt_old_db_message_info.C              tt_old_db_message_info_utils.C \
        tt_old_db_partition_map_ref.C         tt_old_db_utils.C
