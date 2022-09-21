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
# set compiler options
############################################################
if (${CMAKE_C_COMPILER_ID} STREQUAL "Tasking")
    target_compile_options(bstring PRIVATE
        --compact-max-size=200
        --c++=14
        --debug-info=all
        --fp-model=cFlnrSTz
        --indirect
        --instantiate=used
        --iso=99
        --keep-temporary-files
        --no-exceptions
        -OacefgIklMnoprsUvwy,+predict
        --pass-c=--no-warnings=549,588,589 # suppress dead assignment, condition always true/false, pointer assumed non-zero
        --pass-c++=--no-warnings=540,549,588,589 # suppress exception handling, dead assignment, condition always true/false, pointer assumed non-zero
        --rtti
        -Wc--align=0
        -Wc--default-a0-size=0
        -Wc--default-a1-size=0
        -Wc--default-near-size=0
        -Wc--indirect
        -Wc--indirect-runtime
        -Wc--language=-gcc,+volatile,+strings,-kanji
        -Wc--source
        -Wc--switch=auto
        -Wc--tradeoff=4
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

