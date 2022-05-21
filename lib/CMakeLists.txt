cmake_minimum_required(VERSION 3.16)

# reference as an external project so it is always built for the host system
include(ExternalProject)
ExternalProject_Add(generator
    PREFIX gen-build
    SOURCE_DIR  ${CMAKE_CURRENT_SOURCE_DIR}/../gen # must specify all these dirs for install to work
    BINARY_DIR  ${CMAKE_BINARY_DIR}/gen-build
    TMP_DIR     ${CMAKE_BINARY_DIR}/gen-build/tmp
    INSTALL_DIR ${CMAKE_BINARY_DIR}/gen-build
    LOG_DIR     ${CMAKE_BINARY_DIR}/gen-build/log
    STAMP_DIR   ${CMAKE_BINARY_DIR}/gen-build/stamp
    UPDATE_DISCONNECTED TRUE
    CONFIGURE_COMMAND cmake <SOURCE_DIR>
    INSTALL_COMMAND cmake --install <INSTALL_DIR> --prefix=${CMAKE_BINARY_DIR}/host
)

add_library(lib lib.cpp foo.cpp)

target_include_directories(lib PUBLIC .)

add_dependencies(lib generator)

add_custom_command(
    OUTPUT  foo.cpp
    COMMAND ${CMAKE_BINARY_DIR}/host/bin/gen foo.cpp
)
