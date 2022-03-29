############################################################
# CMake toolchain file for TASKING TriCore v6.3R1
#
# see: https://stackoverflow.com/q/41589430
############################################################


set(TRICORE_ENV_VAR "TRICORE_V6_3R1_ROOT")

if(EXISTS $ENV{${TRICORE_ENV_VAR}})
    file(TO_CMAKE_PATH "$ENV{${TRICORE_ENV_VAR}}" TRICORE_ROOT)
else()
    message(FATAL_ERROR "ERROR: ${TRICORE_ENV_VAR} environment variable is not defined.")
endif()

file(TO_CMAKE_PATH "${TRICORE_ROOT}/ctc" TRICORE_TOOLSET)
file(TO_CMAKE_PATH "${TRICORE_TOOLSET}/bin" TRICORE_TOOLSET_BIN)
file(TO_CMAKE_PATH "${TRICORE_TOOLSET_BIN}/cctc.exe" CONTROL_PROGRAM)
file(TO_CMAKE_PATH "${TRICORE_TOOLSET_BIN}/ctc.exe" C_COMPILER)
file(TO_CMAKE_PATH "${TRICORE_TOOLSET_BIN}/cptc.exe" CXX_COMPILER)
file(TO_CMAKE_PATH "${TRICORE_TOOLSET_BIN}/ltc.exe" LINKER)
file(TO_CMAKE_PATH "${TRICORE_TOOLSET_BIN}/artc.exe" ARCHIVER)


#####################################################################
# skip CMake's checks for a working compiler by ommitting
# compilation of CMakeCCompilerID
#####################################################################
set(CMAKE_C_COMPILER_ID "Tasking v6.3r1")
set(CMAKE_CXX_COMPILER_ID "Tasking v6.3r1")


#####################################################################
# try to force the compiler
#####################################################################
set(CMAKE_C_COMPILER_WORKS 1 CACHE INTERNAL "")
set(CMAKE_CXX_COMPILER_WORKS 1 CACHE INTERNAL "")


#####################################################################
# use of "Generic", because target system is an embedded device
#####################################################################
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)


#####################################################################
# set the C and CXX compiler to our control program
# note: For C and CXX specific flags, you'll have to pass them
# see: cctc user guide
#
# ADD TASKING'S BIN PATH TO YOUR $PATH
#####################################################################
set(CMAKE_C_COMPILER ${CONTROL_PROGRAM})
set(CMAKE_CXX_COMPILER ${CONTROL_PROGRAM})


#####################################################################
# set the linker to the control program
#####################################################################
set(CMAKE_LINKER ${CONTROL_PROGRAM})


#####################################################################
# set the archiver to be Tasking's 
#####################################################################
set(CMAKE_AR ${ARCHIVER})


#####################################################################
# Tasking's archiver uses different options than traditional
# archivers, so we have to override the archiver command because
# Tasking's compiler doesn't like the default commands
#####################################################################
set(CMAKE_C_ARCHIVE_CREATE "<CMAKE_AR> -r <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_C_ARCHIVE_APPEND "<CMAKE_AR> <LINK_FLAGS> -r <TARGET> <OBJECTS>")
set(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> -r <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_CXX_ARCHIVE_APPEND "<CMAKE_AR> <LINK_FLAGS> -r <TARGET> <OBJECTS>")


#####################################################################
# Tasking's linker uses different options order than traditional
# linkers, so we have to override the linker command
#####################################################################
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES> -o <TARGET>")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_LINKER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES> -o <TARGET>")


#####################################################################
# the embedded system uses .ELF files so set the executable suffix
# accordingly
#####################################################################
set(CMAKE_EXECUTABLE_SUFFIX .elf)


#####################################################################
# set ranlib to echo to "disable it".  I don't know how to get it
# to work with Tasking's generating .a files and I don't know how
# to disable it with any other more elegant solution.  So just
# override the existing CMAKE_RANLIB command with echo and have it
# print nothing :/
#####################################################################
set(CMAKE_C_ARCHIVE_FINISH "")
set(CMAKE_CXX_ARCHIVE_FINISH "")

