" extra syntax file for cmake
" just extends the syntax defined
" by the https://github.com/pboettch/vim-cmake-syntax
" plugin (which must then be loaded ...)
"
syn case ignore
syn keyword cmakeCommand
            \ add_root_dictionary
            \ find_package_handle_standard_args
            \ jpp_add_executable
            \ jpp_add_file
            \ jpp_add_library
            \ jpp_add_test
            \ jpp_auto_add_executables
            \ jpp_auto_add_scripts
            \ jpp_get_dir_info
            \ jpp_init_custom_properties
            \ jpp_name_target
            \ jpp_target_git_info
            \ o2_add_executable
            \ o2_add_header_only_library
            \ o2_add_library
            \ o2_add_test
            \ o2_add_test_root_macro
            \ o2_add_test_script
            \ o2_build_sanity_checks
            \ o2_check_cxx_features
            \ o2_data_file
            \ o2_define_options
            \ o2_define_output_paths
            \ o2_get_rpath
            \ o2_get_target_dependencies
            \ o2_name_target
            \ o2_protobuf_generate_cpp_dest
            \ o2_rpath
            \ o2_target_man_page
            \ o2_target_root_dictionary

syn case match

syn keyword cmakeKWo2_add_executable contained
            \ IS_TEST
            \ NO_INSTALL
            \ IS_BENCHMARK
            \ COMPONENT_NAME
            \ EXEVARNAME
            \ SOURCES
            \ PUBLIC_LINK_LIBRARIES

syn keyword cmakeKWjpp_add_executable contained
            \ NO_INSTALL
            \ SOURCES
            \ LINK_LIBRARIES
            \ TARGETVARNAME
            \ COMPILE_DEFINITIONS
            \ IS_EXAMPLE

syn keyword cmakeKWjpp_get_dir_info contained
            \ PACKAGE
            \ IS_TEST
            \ IS_DOCUMENT
            \ IS_EXAMPLE
            \ BASE

syn keyword cmakeKWjpp_auto_add_scripts contained

syn keyword cmakeKWjpp_auto_add_executables contained
            \ LINK_LIBRARIES
            \ COMPILE_DEFINITIONS

syn keyword cmakeKWo2_add_header_only_library contained
            \ INCLUDE_DIRECTORIES
            \ INTERFACE_LINK_LIBRARIES

syn keyword cmakeKWo2_add_library contained
            \ SOURCES
            \ PUBLIC_INCLUDE_DIRECTORIES
            \ PUBLIC_LINK_LIBRARIES
            \ PRIVATE_LINK_LIBRARIES
            \ PRIVATE_INCLUDE_DIRECTORIES
            \ TARGETVARNAME

syn keyword cmakeKWjpp_add_library contained
            \ SOURCES
            \ PUBLIC_LINK_LIBRARIES
            \ TARGETVARNAME
            \ PUBLIC_HEADER
            \ ROOT_DICTIONARY
            \ INTERFACE

syn keyword cmakeKWo2_add_test contained
            \ INSTALL
            \ NO_BOOST_TEST
            \ COMPONENT_NAME
            \ TIMEOUT
            \ WORKING_DIRECTORY
            \ SOURCES
            \ PUBLIC_LINK_LIBRARIES
            \ COMMAND_LINE_ARGS
            \ LABELS
            \ ENVIRONMENT

syn keyword cmakeKWjpp_add_test contained
            \ INSTALL
            \ TIMEOUT
            \ WORKING_DIRECTORY
            \ SOURCES
            \ PUBLIC_LINK_LIBRARIES
            \ COMMAND
            \ COMMAND_LINE_ARGS
            \ LABELS
            \ ENVIRONMENT
            \ ENVIRONMENT_MODIFICATION
            \ USE_TEMPORARY_DIR
            \ USE_EXAMPLES

syn keyword cmakeKWo2_add_test_script contained
            \ COMMAND
            \ WORKING_DIRECTORY
            \ TIMEOUT
            \ NAME
            \ COMMAND_LINE_ARGS
            \ LABELS
            \ CONFIGURATIONS
            \ ENVIRONMENT

syn keyword cmakeKWo2_add_test_root_macro contained
            \ COMPILE
            \ COMPILE_ONLY
            \ ENVIRONMENT
            \ PUBLIC_LINK_LIBRARIES
            \ PUBLIC_INCLUDE_DIRECTORIES
            \ LABELS

syn keyword cmakeKWo2_target_root_dictionary contained
            \ LINKDEF
            \ HEADERS

syn keyword cmakeKWo2_target_man_page contained
            \ NAME
            \ SECTION

syn keyword cmakeKWadd_root_dictionary contained
            \ LINKDEF
            \ HEADERS
            \ BASENAME

syn keyword cmakeKWo2_data_file contained
            \ COPY
            \ DESTINATION

syn keyword cmakeKWjpp_add_file contained
            \ COPY
            \ IS_DATA
            \ IS_SCRIPT

syn keyword cmakeKWo2_name_target contained
            \ INTERFACE_LINK_LIBRARIES
            \ INCLUDE_DIRECTORIES

syn keyword cmakeKWjpp_name_target contained
            \ IS_EXE
            \ NAME

syn keyword cmakeKWfind_package_handle_standard_args contained
            \ DEFAULT_MSG
            \ FOUND_VAR
            \ REQUIRED_VARS
            \ VERSION_VAR
            \ HANDLE_COMPONENTS
            \ CONFIG_MODE
            \ FAIL_MESSAGE

hi def link cmakeKWadd_root_dictionary ModeMsg
hi def link cmakeKWfind_package_handle_standard_args ModeMsg
hi def link cmakeKWjpp_add_executable ModeMsg
hi def link cmakeKWjpp_add_file ModeMsg
hi def link cmakeKWjpp_add_library ModeMsg
hi def link cmakeKWjpp_add_test ModeMsg
hi def link cmakeKWjpp_auto_add_executables ModeMsg
hi def link cmakeKWjpp_auto_add_scripts ModeMsg
hi def link cmakeKWjpp_get_dir_info ModeMsg
hi def link cmakeKWjpp_init_custom_properties ModeMsg
hi def link cmakeKWjpp_name_target ModeMsg
hi def link cmakeKWjpp_target_git_info ModeMsg
hi def link cmakeKWo2_add_executable ModeMsg
hi def link cmakeKWo2_add_header_only_library ModeMsg
hi def link cmakeKWo2_add_library ModeMsg
hi def link cmakeKWo2_add_test ModeMsg
hi def link cmakeKWo2_add_test_root_macro ModeMsg
hi def link cmakeKWo2_add_test_script ModeMsg
hi def link cmakeKWo2_build_sanity_checks ModeMsg
hi def link cmakeKWo2_check_cxx_features ModeMsg
hi def link cmakeKWo2_define_options ModeMsg
hi def link cmakeKWo2_define_output_paths ModeMsg
hi def link cmakeKWo2_get_rpath ModeMsg
hi def link cmakeKWo2_get_target_dependencies ModeMsg
hi def link cmakeKWo2_name_target ModeMsg
hi def link cmakeKWo2_rpath ModeMsg
hi def link cmakeKWo2_target_man_page ModeMsg
hi def link cmakeKWo2_target_root_dictionary ModeMsg
