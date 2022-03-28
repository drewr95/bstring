############################################################
# Top level CMakeLists file for bstring
############################################################

############################################################
# set the minimum required cmake version.
# only update if we need new features but don't use really
# old versions.
############################################################
cmake_minimum_required(VERSION 3.16 FATAL_ERROR)


############################################################
# set options for build target
############################################################
OPTION(BUILD_TEST "Build test software" OFF)


############################################################
# set the project name
############################################################
project(bstring
        DESCRIPTION "bstring library"
        LANGUAGES C CXX
)


############################################################
# add subdirectories
############################################################
add_subdirectory("bstring")

if (BUILD_TEST)
    add_subdirectory("test")
endif ()

