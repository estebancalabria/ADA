pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__default-main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__default-main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "system__os_lib_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__exceptions_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "ada__containers_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__io_exceptions_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings__maps_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps__constants_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "interfaces__c_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "system__exceptions_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__object_reader_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "system__dwarf_lines_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__soft_links__initialize_E");
   E035 : Short_Integer; pragma Import (Ada, E035, "system__traceback__symbolic_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "ada__numerics_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "ada__strings__utf_encoding_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__tags_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "ada__strings__text_buffers_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "gnat_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "interfaces__c__strings_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__streams_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__file_control_block_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__finalization_root_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ada__finalization_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__file_io_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "ada__streams__stream_io_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "system__storage_pools_E");
   E314 : Short_Integer; pragma Import (Ada, E314, "system__finalization_masters_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "system__storage_pools__subpools_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "ada__strings__unbounded_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "system__task_info_E");
   E310 : Short_Integer; pragma Import (Ada, E310, "system__regpat_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "ada__calendar_E");
   E398 : Short_Integer; pragma Import (Ada, E398, "ada__calendar__delays_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "ada__calendar__time_zones_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ada__real_time_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "ada__text_io_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "gnat__calendar_E");
   E306 : Short_Integer; pragma Import (Ada, E306, "gnat__calendar__time_io_E");
   E418 : Short_Integer; pragma Import (Ada, E418, "gnat__secure_hashes_E");
   E420 : Short_Integer; pragma Import (Ada, E420, "gnat__secure_hashes__md5_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "gnat__md5_E");
   E449 : Short_Integer; pragma Import (Ada, E449, "gnat__secure_hashes__sha1_E");
   E458 : Short_Integer; pragma Import (Ada, E458, "gnat__secure_hashes__sha2_common_E");
   E456 : Short_Integer; pragma Import (Ada, E456, "gnat__secure_hashes__sha2_32_E");
   E447 : Short_Integer; pragma Import (Ada, E447, "gnat__sha1_E");
   E454 : Short_Integer; pragma Import (Ada, E454, "gnat__sha256_E");
   E318 : Short_Integer; pragma Import (Ada, E318, "system__pool_global_E");
   E368 : Short_Integer; pragma Import (Ada, E368, "gnat__sockets_E");
   E371 : Short_Integer; pragma Import (Ada, E371, "gnat__sockets__poll_E");
   E375 : Short_Integer; pragma Import (Ada, E375, "gnat__sockets__thin_common_E");
   E373 : Short_Integer; pragma Import (Ada, E373, "gnat__sockets__thin_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "system__random_seed_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "system__regexp_E");
   E276 : Short_Integer; pragma Import (Ada, E276, "ada__directories_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "system__tasking__initialization_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "system__tasking__protected_objects_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "system__tasking__protected_objects__entries_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "system__tasking__queuing_E");
   E452 : Short_Integer; pragma Import (Ada, E452, "system__tasking__stages_E");
   E379 : Short_Integer; pragma Import (Ada, E379, "aws__containers__key_value_E");
   E364 : Short_Integer; pragma Import (Ada, E364, "aws__containers__string_vectors_E");
   E406 : Short_Integer; pragma Import (Ada, E406, "aws__containers__tables_E");
   E346 : Short_Integer; pragma Import (Ada, E346, "memory_streams_E");
   E356 : Short_Integer; pragma Import (Ada, E356, "templates_parser_tasking_E");
   E337 : Short_Integer; pragma Import (Ada, E337, "zlib_E");
   E339 : Short_Integer; pragma Import (Ada, E339, "zlib__thin_E");
   E286 : Short_Integer; pragma Import (Ada, E286, "templates_parser_E");
   E352 : Short_Integer; pragma Import (Ada, E352, "templates_parser__input_E");
   E354 : Short_Integer; pragma Import (Ada, E354, "templates_parser__utils_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "aws__utils_E");
   E329 : Short_Integer; pragma Import (Ada, E329, "aws__resources_E");
   E348 : Short_Integer; pragma Import (Ada, E348, "aws__resources__files_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "aws__resources__streams_E");
   E350 : Short_Integer; pragma Import (Ada, E350, "aws__resources__streams__disk_E");
   E341 : Short_Integer; pragma Import (Ada, E341, "aws__resources__streams__memory_E");
   E331 : Short_Integer; pragma Import (Ada, E331, "aws__resources__embedded_E");
   E335 : Short_Integer; pragma Import (Ada, E335, "aws__resources__streams__zlib_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "aws__net_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "aws__net__log_E");
   E358 : Short_Integer; pragma Import (Ada, E358, "aws__net__poll_events_E");
   E360 : Short_Integer; pragma Import (Ada, E360, "aws__net__poll_events__g_poll_E");
   E366 : Short_Integer; pragma Import (Ada, E366, "aws__net__std_E");
   E362 : Short_Integer; pragma Import (Ada, E362, "aws__net__ssl_E");
   E485 : Short_Integer; pragma Import (Ada, E485, "aws__net__generic_sets_E");
   E507 : Short_Integer; pragma Import (Ada, E507, "aws__net__acceptors_E");
   E487 : Short_Integer; pragma Import (Ada, E487, "aws__net__memory_E");
   E479 : Short_Integer; pragma Import (Ada, E479, "aws__net__ssl__certificate_E");
   E481 : Short_Integer; pragma Import (Ada, E481, "aws__net__ssl__certificate__impl_E");
   E410 : Short_Integer; pragma Import (Ada, E410, "aws__resources__streams__disk__once_E");
   E386 : Short_Integer; pragma Import (Ada, E386, "aws__resources__streams__memory__zlib_E");
   E384 : Short_Integer; pragma Import (Ada, E384, "aws__translator_E");
   E414 : Short_Integer; pragma Import (Ada, E414, "aws__digest_E");
   E381 : Short_Integer; pragma Import (Ada, E381, "aws__net__buffered_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "aws__config_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "aws__config__ini_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "aws__config__utils_E");
   E404 : Short_Integer; pragma Import (Ada, E404, "aws__headers_E");
   E408 : Short_Integer; pragma Import (Ada, E408, "aws__headers__values_E");
   E426 : Short_Integer; pragma Import (Ada, E426, "aws__messages_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "aws__mime_E");
   E433 : Short_Integer; pragma Import (Ada, E433, "aws__attachments_E");
   E392 : Short_Integer; pragma Import (Ada, E392, "aws__config__set_E");
   E512 : Short_Integer; pragma Import (Ada, E512, "aws__services__transient_pages_E");
   E516 : Short_Integer; pragma Import (Ada, E516, "aws__services__transient_pages__control_E");
   E445 : Short_Integer; pragma Import (Ada, E445, "aws__utils__streams_E");
   E443 : Short_Integer; pragma Import (Ada, E443, "aws__session_E");
   E518 : Short_Integer; pragma Import (Ada, E518, "aws__session__control_E");
   E435 : Short_Integer; pragma Import (Ada, E435, "aws__parameters_E");
   E437 : Short_Integer; pragma Import (Ada, E437, "aws__url_E");
   E428 : Short_Integer; pragma Import (Ada, E428, "aws__status_E");
   E402 : Short_Integer; pragma Import (Ada, E402, "aws__response_E");
   E475 : Short_Integer; pragma Import (Ada, E475, "aws__client_E");
   E477 : Short_Integer; pragma Import (Ada, E477, "aws__client__http_utils_E");
   E400 : Short_Integer; pragma Import (Ada, E400, "aws__dispatchers_E");
   E460 : Short_Integer; pragma Import (Ada, E460, "aws__dispatchers__callback_E");
   E493 : Short_Integer; pragma Import (Ada, E493, "aws__hotplug_E");
   E503 : Short_Integer; pragma Import (Ada, E503, "aws__hotplug__get_status_E");
   E462 : Short_Integer; pragma Import (Ada, E462, "aws__log_E");
   E466 : Short_Integer; pragma Import (Ada, E466, "aws__net__websocket_E");
   E495 : Short_Integer; pragma Import (Ada, E495, "aws__net__websocket__handshake_error_E");
   E467 : Short_Integer; pragma Import (Ada, E467, "aws__net__websocket__protocol_E");
   E469 : Short_Integer; pragma Import (Ada, E469, "aws__net__websocket__protocol__draft76_E");
   E471 : Short_Integer; pragma Import (Ada, E471, "aws__net__websocket__protocol__rfc6455_E");
   E483 : Short_Integer; pragma Import (Ada, E483, "aws__net__websocket__registry_E");
   E489 : Short_Integer; pragma Import (Ada, E489, "aws__net__websocket__registry__control_E");
   E497 : Short_Integer; pragma Import (Ada, E497, "aws__net__websocket__registry__utils_E");
   E412 : Short_Integer; pragma Import (Ada, E412, "aws__response__set_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "aws__server_E");
   E499 : Short_Integer; pragma Import (Ada, E499, "aws__server__get_status_E");
   E491 : Short_Integer; pragma Import (Ada, E491, "aws__server__http_utils_E");
   E505 : Short_Integer; pragma Import (Ada, E505, "aws__server__log_E");
   E501 : Short_Integer; pragma Import (Ada, E501, "aws__server__status_E");
   E473 : Short_Integer; pragma Import (Ada, E473, "aws__status__set_E");
   E520 : Short_Integer; pragma Import (Ada, E520, "aws__status__translate_set_E");
   E439 : Short_Integer; pragma Import (Ada, E439, "aws__url__raise_url_error_E");
   E441 : Short_Integer; pragma Import (Ada, E441, "aws__url__set_E");
   E524 : Short_Integer; pragma Import (Ada, E524, "default__callbacks_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E437 := E437 - 1;
      E475 := E475 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "aws__server__finalize_body");
      begin
         E396 := E396 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "aws__net__websocket__finalize_body");
      begin
         E466 := E466 - 1;
         F2;
      end;
      E435 := E435 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "aws__server__finalize_spec");
      begin
         F3;
      end;
      E402 := E402 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "aws__net__websocket__registry__finalize_body");
      begin
         E483 := E483 - 1;
         F4;
      end;
      E471 := E471 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "aws__net__websocket__protocol__rfc6455__finalize_spec");
      begin
         F5;
      end;
      E469 := E469 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "aws__net__websocket__protocol__draft76__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aws__net__websocket__protocol__finalize_spec");
      begin
         E467 := E467 - 1;
         F7;
      end;
      E495 := E495 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aws__net__websocket__handshake_error__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aws__net__websocket__finalize_spec");
      begin
         F9;
      end;
      E462 := E462 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "aws__log__finalize_spec");
      begin
         F10;
      end;
      E493 := E493 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "aws__hotplug__finalize_spec");
      begin
         F11;
      end;
      E460 := E460 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "aws__dispatchers__callback__finalize_spec");
      begin
         F12;
      end;
      E400 := E400 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "aws__dispatchers__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "aws__client__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "aws__response__finalize_spec");
      begin
         F15;
      end;
      E428 := E428 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "aws__status__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "aws__url__finalize_spec");
      begin
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "aws__parameters__finalize_spec");
      begin
         F18;
      end;
      declare
         procedure F19;
         pragma Import (Ada, F19, "aws__session__finalize_body");
      begin
         E443 := E443 - 1;
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "aws__session__finalize_spec");
      begin
         F20;
      end;
      E445 := E445 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "aws__utils__streams__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "aws__services__transient_pages__finalize_body");
      begin
         E512 := E512 - 1;
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "aws__services__transient_pages__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "aws__attachments__finalize_body");
      begin
         E433 := E433 - 1;
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "aws__attachments__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "aws__mime__finalize_body");
      begin
         E394 := E394 - 1;
         F26;
      end;
      E426 := E426 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "aws__messages__finalize_spec");
      begin
         F27;
      end;
      E404 := E404 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "aws__headers__finalize_spec");
      begin
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "aws__config__finalize_body");
      begin
         E107 := E107 - 1;
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "aws__config__finalize_spec");
      begin
         F30;
      end;
      E386 := E386 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "aws__resources__streams__memory__zlib__finalize_spec");
      begin
         F31;
      end;
      E410 := E410 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "aws__resources__streams__disk__once__finalize_spec");
      begin
         F32;
      end;
      E479 := E479 - 1;
      declare
         procedure F33;
         pragma Import (Ada, F33, "aws__net__ssl__certificate__finalize_spec");
      begin
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "aws__net__memory__finalize_body");
      begin
         E487 := E487 - 1;
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "aws__net__memory__finalize_spec");
      begin
         F35;
      end;
      E507 := E507 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "aws__net__acceptors__finalize_spec");
      begin
         F36;
      end;
      E139 := E139 - 1;
      E362 := E362 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "aws__net__ssl__finalize_spec");
      begin
         F37;
      end;
      E366 := E366 - 1;
      declare
         procedure F38;
         pragma Import (Ada, F38, "aws__net__std__finalize_spec");
      begin
         F38;
      end;
      E358 := E358 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "aws__net__poll_events__finalize_spec");
      begin
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "aws__net__log__finalize_body");
      begin
         E172 := E172 - 1;
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "aws__net__finalize_spec");
      begin
         F41;
      end;
      declare
         procedure F42;
         pragma Import (Ada, F42, "templates_parser__finalize_body");
      begin
         E286 := E286 - 1;
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "aws__resources__embedded__finalize_body");
      begin
         E331 := E331 - 1;
         F43;
      end;
      E335 := E335 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "aws__resources__streams__zlib__finalize_spec");
      begin
         F44;
      end;
      E341 := E341 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "aws__resources__streams__memory__finalize_spec");
      begin
         F45;
      end;
      E350 := E350 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "aws__resources__streams__disk__finalize_spec");
      begin
         F46;
      end;
      E333 := E333 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "aws__resources__streams__finalize_spec");
      begin
         F47;
      end;
      E174 := E174 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "aws__utils__finalize_spec");
      begin
         F48;
      end;
      declare
         procedure F49;
         pragma Import (Ada, F49, "templates_parser__finalize_spec");
      begin
         F49;
      end;
      E337 := E337 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "zlib__finalize_spec");
      begin
         F50;
      end;
      declare
         procedure F51;
         pragma Import (Ada, F51, "templates_parser_tasking__finalize_body");
      begin
         E356 := E356 - 1;
         F51;
      end;
      E406 := E406 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "aws__containers__tables__finalize_spec");
      begin
         F52;
      end;
      E242 := E242 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F53;
      end;
      E276 := E276 - 1;
      declare
         procedure F54;
         pragma Import (Ada, F54, "ada__directories__finalize_spec");
      begin
         F54;
      end;
      E284 := E284 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "system__regexp__finalize_spec");
      begin
         F55;
      end;
      declare
         procedure F56;
         pragma Import (Ada, F56, "gnat__sockets__finalize_body");
      begin
         E368 := E368 - 1;
         F56;
      end;
      declare
         procedure F57;
         pragma Import (Ada, F57, "gnat__sockets__finalize_spec");
      begin
         F57;
      end;
      E318 := E318 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "system__pool_global__finalize_spec");
      begin
         F58;
      end;
      E121 := E121 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "ada__text_io__finalize_spec");
      begin
         F59;
      end;
      E210 := E210 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "ada__strings__unbounded__finalize_spec");
      begin
         F60;
      end;
      E322 := E322 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "system__storage_pools__subpools__finalize_spec");
      begin
         F61;
      end;
      E314 := E314 - 1;
      declare
         procedure F62;
         pragma Import (Ada, F62, "system__finalization_masters__finalize_spec");
      begin
         F62;
      end;
      E206 := E206 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "ada__streams__stream_io__finalize_spec");
      begin
         F63;
      end;
      declare
         procedure F64;
         pragma Import (Ada, F64, "system__file_io__finalize_body");
      begin
         E131 := E131 - 1;
         F64;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           True, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, True, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, False, True, False, False, True, True, 
           False, True, True, False, True, True, True, True, 
           False, True, False, True, False, True, False, True, 
           True, False, True, True, True, True, False, True, 
           True, True, True, False, False, True, False, True, 
           True, True, False, False, False, False, True, True, 
           True, True, True, True, True, True, False, True, 
           True, True, False, True, True, False, True, True, 
           True, True, False, False, False, True, False, False, 
           False, False, True, True, True, True, False, True, 
           False),
         Count => (0, 0, 0, 6, 3, 2, 4, 0, 18, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Containers'Elab_Spec;
      E036 := E036 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E063 := E063 + 1;
      Ada.Strings'Elab_Spec;
      E048 := E048 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E050 := E050 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E054 := E054 + 1;
      Interfaces.C'Elab_Spec;
      E073 := E073 + 1;
      System.Exceptions'Elab_Spec;
      E024 := E024 + 1;
      System.Object_Reader'Elab_Spec;
      E075 := E075 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E043 := E043 + 1;
      System.Os_Lib'Elab_Body;
      E067 := E067 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E019 := E019 + 1;
      E011 := E011 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E035 := E035 + 1;
      E005 := E005 + 1;
      Ada.Numerics'Elab_Spec;
      E195 := E195 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E094 := E094 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E100 := E100 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      Ada.Strings.Text_Buffers'Elab_Body;
      E092 := E092 + 1;
      Gnat'Elab_Spec;
      E297 := E297 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E111 := E111 + 1;
      Ada.Streams'Elab_Spec;
      E123 := E123 + 1;
      System.File_Control_Block'Elab_Spec;
      E135 := E135 + 1;
      System.Finalization_Root'Elab_Spec;
      System.Finalization_Root'Elab_Body;
      E134 := E134 + 1;
      Ada.Finalization'Elab_Spec;
      E132 := E132 + 1;
      System.File_Io'Elab_Body;
      E131 := E131 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      Ada.Streams.Stream_Io'Elab_Body;
      E206 := E206 + 1;
      System.Storage_Pools'Elab_Spec;
      E316 := E316 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E314 := E314 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Body;
      E322 := E322 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      Ada.Strings.Unbounded'Elab_Body;
      E210 := E210 + 1;
      System.Task_Info'Elab_Spec;
      E162 := E162 + 1;
      System.Regpat'Elab_Spec;
      E310 := E310 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E176 := E176 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E398 := E398 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E178 := E178 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E141 := E141 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E121 := E121 + 1;
      Gnat.Calendar'Elab_Spec;
      E301 := E301 + 1;
      Gnat.Calendar.Time_Io'Elab_Spec;
      E306 := E306 + 1;
      E418 := E418 + 1;
      E420 := E420 + 1;
      Gnat.Md5'Elab_Spec;
      E416 := E416 + 1;
      E449 := E449 + 1;
      E458 := E458 + 1;
      E456 := E456 + 1;
      Gnat.Sha1'Elab_Spec;
      E447 := E447 + 1;
      Gnat.Sha256'Elab_Spec;
      E454 := E454 + 1;
      System.Pool_Global'Elab_Spec;
      System.Pool_Global'Elab_Body;
      E318 := E318 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E375 := E375 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E373 := E373 + 1;
      Gnat.Sockets'Elab_Body;
      E368 := E368 + 1;
      E371 := E371 + 1;
      System.Random_Seed'Elab_Body;
      E264 := E264 + 1;
      System.Regexp'Elab_Spec;
      System.Regexp'Elab_Body;
      E284 := E284 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E276 := E276 + 1;
      System.Tasking.Initialization'Elab_Body;
      E230 := E230 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E240 := E240 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E242 := E242 + 1;
      System.Tasking.Queuing'Elab_Body;
      E238 := E238 + 1;
      System.Tasking.Stages'Elab_Body;
      E452 := E452 + 1;
      AWS.CONTAINERS.KEY_VALUE'ELAB_SPEC;
      E379 := E379 + 1;
      AWS.CONTAINERS.STRING_VECTORS'ELAB_SPEC;
      E364 := E364 + 1;
      AWS.CONTAINERS.TABLES'ELAB_SPEC;
      AWS.CONTAINERS.TABLES'ELAB_BODY;
      E406 := E406 + 1;
      E346 := E346 + 1;
      Templates_Parser_Tasking'Elab_Body;
      E356 := E356 + 1;
      Zlib'Elab_Spec;
      Zlib.Thin'Elab_Body;
      E339 := E339 + 1;
      Zlib'Elab_Body;
      E337 := E337 + 1;
      Templates_Parser'Elab_Spec;
      Templates_Parser.Input'Elab_Spec;
      Templates_Parser.Utils'Elab_Spec;
      E354 := E354 + 1;
      AWS.UTILS'ELAB_SPEC;
      AWS.UTILS'ELAB_BODY;
      E174 := E174 + 1;
      AWS.RESOURCES'ELAB_SPEC;
      AWS.RESOURCES.STREAMS'ELAB_SPEC;
      AWS.RESOURCES.STREAMS'ELAB_BODY;
      E333 := E333 + 1;
      AWS.RESOURCES.STREAMS.DISK'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.DISK'ELAB_BODY;
      E350 := E350 + 1;
      AWS.RESOURCES.STREAMS.MEMORY'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.MEMORY'ELAB_BODY;
      E341 := E341 + 1;
      E329 := E329 + 1;
      AWS.RESOURCES.STREAMS.ZLIB'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.ZLIB'ELAB_BODY;
      E335 := E335 + 1;
      AWS.RESOURCES.EMBEDDED'ELAB_BODY;
      E331 := E331 + 1;
      E348 := E348 + 1;
      Templates_Parser'Elab_Body;
      E286 := E286 + 1;
      E352 := E352 + 1;
      AWS.NET'ELAB_SPEC;
      AWS.NET.LOG'ELAB_BODY;
      E172 := E172 + 1;
      AWS.NET.POLL_EVENTS'ELAB_SPEC;
      E360 := E360 + 1;
      AWS.NET.POLL_EVENTS'ELAB_BODY;
      E358 := E358 + 1;
      AWS.NET.STD'ELAB_SPEC;
      AWS.NET.STD'ELAB_BODY;
      E366 := E366 + 1;
      AWS.NET.SSL'ELAB_SPEC;
      AWS.NET.SSL'ELAB_BODY;
      E362 := E362 + 1;
      AWS.NET'ELAB_BODY;
      E139 := E139 + 1;
      E485 := E485 + 1;
      AWS.NET.ACCEPTORS'ELAB_SPEC;
      AWS.NET.ACCEPTORS'ELAB_BODY;
      E507 := E507 + 1;
      AWS.NET.MEMORY'ELAB_SPEC;
      AWS.NET.MEMORY'ELAB_BODY;
      E487 := E487 + 1;
      AWS.NET.SSL.CERTIFICATE'ELAB_SPEC;
      E481 := E481 + 1;
      E479 := E479 + 1;
      AWS.RESOURCES.STREAMS.DISK.ONCE'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.DISK.ONCE'ELAB_BODY;
      E410 := E410 + 1;
      AWS.RESOURCES.STREAMS.MEMORY.ZLIB'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.MEMORY.ZLIB'ELAB_BODY;
      E386 := E386 + 1;
      E384 := E384 + 1;
      AWS.DIGEST'ELAB_BODY;
      E414 := E414 + 1;
      AWS.NET.BUFFERED'ELAB_SPEC;
      AWS.NET.BUFFERED'ELAB_BODY;
      E381 := E381 + 1;
      AWS.CONFIG'ELAB_SPEC;
      AWS.CONFIG'ELAB_BODY;
      E107 := E107 + 1;
      E137 := E137 + 1;
      E113 := E113 + 1;
      AWS.HEADERS'ELAB_SPEC;
      AWS.HEADERS'ELAB_BODY;
      E404 := E404 + 1;
      AWS.HEADERS.VALUES'ELAB_BODY;
      E408 := E408 + 1;
      AWS.MESSAGES'ELAB_SPEC;
      E426 := E426 + 1;
      AWS.MIME'ELAB_BODY;
      E394 := E394 + 1;
      AWS.ATTACHMENTS'ELAB_SPEC;
      AWS.ATTACHMENTS'ELAB_BODY;
      E433 := E433 + 1;
      E392 := E392 + 1;
      AWS.SERVICES.TRANSIENT_PAGES'ELAB_SPEC;
      AWS.SERVICES.TRANSIENT_PAGES'ELAB_BODY;
      E512 := E512 + 1;
      E516 := E516 + 1;
      AWS.UTILS.STREAMS'ELAB_SPEC;
      E445 := E445 + 1;
      AWS.SESSION'ELAB_SPEC;
      AWS.SESSION'ELAB_BODY;
      E443 := E443 + 1;
      E518 := E518 + 1;
      AWS.PARAMETERS'ELAB_SPEC;
      AWS.URL'ELAB_SPEC;
      AWS.STATUS'ELAB_SPEC;
      E428 := E428 + 1;
      AWS.RESPONSE'ELAB_SPEC;
      AWS.CLIENT'ELAB_SPEC;
      AWS.DISPATCHERS'ELAB_SPEC;
      AWS.DISPATCHERS'ELAB_BODY;
      E400 := E400 + 1;
      AWS.DISPATCHERS.CALLBACK'ELAB_SPEC;
      AWS.DISPATCHERS.CALLBACK'ELAB_BODY;
      E460 := E460 + 1;
      AWS.HOTPLUG'ELAB_SPEC;
      E493 := E493 + 1;
      E503 := E503 + 1;
      AWS.LOG'ELAB_SPEC;
      AWS.LOG'ELAB_BODY;
      E462 := E462 + 1;
      AWS.NET.WEBSOCKET'ELAB_SPEC;
      AWS.NET.WEBSOCKET.HANDSHAKE_ERROR'ELAB_SPEC;
      AWS.NET.WEBSOCKET.HANDSHAKE_ERROR'ELAB_BODY;
      E495 := E495 + 1;
      AWS.NET.WEBSOCKET.PROTOCOL'ELAB_SPEC;
      E467 := E467 + 1;
      AWS.NET.WEBSOCKET.PROTOCOL.DRAFT76'ELAB_SPEC;
      AWS.NET.WEBSOCKET.PROTOCOL.DRAFT76'ELAB_BODY;
      E469 := E469 + 1;
      AWS.NET.WEBSOCKET.PROTOCOL.RFC6455'ELAB_SPEC;
      AWS.NET.WEBSOCKET.PROTOCOL.RFC6455'ELAB_BODY;
      E471 := E471 + 1;
      AWS.NET.WEBSOCKET.REGISTRY'ELAB_SPEC;
      AWS.NET.WEBSOCKET.REGISTRY'ELAB_BODY;
      E483 := E483 + 1;
      E489 := E489 + 1;
      E497 := E497 + 1;
      E477 := E477 + 1;
      AWS.RESPONSE'ELAB_BODY;
      E402 := E402 + 1;
      AWS.SERVER'ELAB_SPEC;
      AWS.PARAMETERS'ELAB_BODY;
      E435 := E435 + 1;
      E412 := E412 + 1;
      AWS.SERVER.HTTP_UTILS'ELAB_SPEC;
      E505 := E505 + 1;
      E499 := E499 + 1;
      AWS.NET.WEBSOCKET'ELAB_BODY;
      E466 := E466 + 1;
      AWS.SERVER.HTTP_UTILS'ELAB_BODY;
      E491 := E491 + 1;
      E520 := E520 + 1;
      AWS.SERVER'ELAB_BODY;
      E396 := E396 + 1;
      E439 := E439 + 1;
      E441 := E441 + 1;
      AWS.CLIENT'ELAB_BODY;
      E475 := E475 + 1;
      E501 := E501 + 1;
      E473 := E473 + 1;
      AWS.URL'ELAB_BODY;
      E437 := E437 + 1;
      E524 := E524 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_default__main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Cursos\ADA\16.web\obj\default.o
   --   C:\Cursos\ADA\16.web\obj\default-callbacks.o
   --   C:\Cursos\ADA\16.web\obj\default-main.o
   --   -LC:\Cursos\ADA\16.web\obj\
   --   -LC:\Cursos\ADA\16.web\obj\
   --   -LC:\coding\gnat\lib\aws.static\
   --   -LC:\coding\gnat\lib\xmlada\xmlada_schema.static\
   --   -LC:\coding\gnat\lib\xmlada\xmlada_sax.static\
   --   -LC:\coding\gnat\lib\xmlada\xmlada_unicode.static\
   --   -LC:\coding\gnat\lib\xmlada\xmlada_input.static\
   --   -LC:\coding\gnat\lib\xmlada\xmlada_dom.static\
   --   -LC:/coding/gnat/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/
   --   -static
   --   -lws2_32
   --   -lgnarl
   --   -lgnat
   --   -lws2_32
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -lm
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
