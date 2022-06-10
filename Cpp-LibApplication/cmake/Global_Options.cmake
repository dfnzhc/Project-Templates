﻿set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "CMake")

if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to 'Release' as none was specified.")
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif ()

if (MSVC)
    list(APPEND ${DEFINES_PREFIX}_DEFINITIONS "_CRT_SECURE_NO_WARNINGS")
    list(APPEND ${DEFINES_PREFIX}_DEFINITIONS "_ENABLE_EXTENDED_ALIGNED_STORAGE")
endif ()

if (WIN32)
    list(APPEND ${DEFINES_PREFIX}_DEFINITIONS "${DEFINES_PREFIX}_IN_WINDOWS" "NOMINMAX" "WIN32_LEAN_AND_MEAN")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")
endif (WIN32)

# build options
set(${DEFINES_PREFIX}_BUILD_APPS ON CACHE BOOL "Enable generation and building of applications.")
set(${DEFINES_PREFIX}_BUILD_TESTS ON CACHE BOOL "Enable generation and building of tests.")
set(${DEFINES_PREFIX}_WARNING_AS_ERROR ON CACHE BOOL "Enable Warnings as Errors")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

set(CMAKE_C_FLAGS_DEBUG   "-DDEBUG=0 ${CMAKE_C_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG=0 ${CMAKE_CXX_FLAGS_DEBUG}")
