include(ExternalProject)


add_library(ffmpeg INTERFACE)

if("${MSVC_C_ARCHITECTURE_ID}" STREQUAL "X86")
    include("win32.cmake")
elseif("${MSVC_C_ARCHITECTURE_ID}" STREQUAL "x64")
    include("win64.cmake")
else()
    message("unkonw MSVC_C_ARCHITECTURE_ID: ${MSVC_C_ARCHITECTURE_ID}")
endif()



message("CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")