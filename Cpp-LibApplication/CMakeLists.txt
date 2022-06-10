cmake_minimum_required(VERSION 3.21)

set(THE_PROJECT_NAME "project")
set(THE_LIB_NAME "lab")
set(DEFINES_PREFIX "PROJ")

# set the name of project
project(${THE_PROJECT_NAME})

# add the path of local cmake scripts
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(Global_Options)

list(APPEND ${DEFINES_PREFIX}_DEFINITIONS ${DEFINES_PREFIX}_ROOT_PATH="${CMAKE_CURRENT_SOURCE_DIR}")

# add third party libraries
add_subdirectory(third_party)

# add the library
add_subdirectory(THE_LIB)

if(${DEFINES_PREFIX}_BUILD_APPS)
    # add applications
    add_subdirectory(apps)
endif()

if(${DEFINES_PREFIX}_BUILD_TESTS)
    # add tests
    add_subdirectory(tests)
endif()