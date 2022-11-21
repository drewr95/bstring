############################################################
# src CmakeLists files
############################################################

############################################################
# generate the static library
############################################################
add_library(bstring STATIC
    bstraux.c
    bstraux.h
    bstrlib.c
    bstrlib.h
)


############################################################
# generate the static library
############################################################
set_target_properties(bstring PROPERTIES
    OUTPUT_NAME "bstring"
    DEBUG_POSTFIX "d"
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED true
    FOLDER "bstring"
)


############################################################
# set compiler options
############################################################
if (${CMAKE_C_COMPILER_ID} STREQUAL "Tasking ctc")
    target_compile_options(bstring PRIVATE
        --pass-c=--no-warnings=540,549,588,589 # suppress exception handling, dead assignment, condition always true/false, pointer assumed non-zero
    )
endif ()


############################################################
# set include directories
############################################################
target_include_directories(bstring PRIVATE
    .
)


############################################################
# set IDE folders
############################################################
get_property(TARGET_SOURCE_FILES TARGET bstring PROPERTY SOURCES)
source_group(TREE "${CMAKE_CURRENT_LIST_DIR}" FILES ${TARGET_SOURCE_FILES})

