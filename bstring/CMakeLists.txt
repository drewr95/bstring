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
    EXCLUDE_FROM_ALL false
    EXCLUDE_FROM_DEFAULT_BUILD false
)


############################################################
# set preprocessor defines
############################################################
target_compile_definitions(bstring PRIVATE
)


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

