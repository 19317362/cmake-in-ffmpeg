include(ExternalProject)

ExternalProject_Add(ffmpeg-dev-project
    PREFIX deps/ffmpeg-dev
    DOWNLOAD_NAME ffmpeg-3.4.1-win64-dev.zip
    DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}
    URL https://ffmpeg.zeranoe.com/builds/win64/dev/ffmpeg-3.4.1-win64-dev.zip
    URL_HASH SHA256=21be6704bd57497ee2307646002e4aac0d496d7dc72dceb4847e9e6c0be257bf
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)


ExternalProject_Add(ffmpeg-shared-project
    PREFIX deps/ffmpeg-shared
    DOWNLOAD_NAME ffmpeg-3.4.1-win64-shared.zip
    DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}
    URL https://ffmpeg.zeranoe.com/builds/win64/shared/ffmpeg-3.4.1-win64-shared.zip
    URL_HASH SHA256=14eca81117af4c081d820d5bb669437ac9380060feaecb1d438188daf3eaca96
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)


add_library(ffmpeg INTERFACE)

ExternalProject_Get_Property(ffmpeg-dev-project SOURCE_DIR)
target_include_directories(ffmpeg 
    INTERFACE ${SOURCE_DIR}/include
    )
target_link_libraries(ffmpeg
    INTERFACE ${SOURCE_DIR}/lib/avcodec.lib
    INTERFACE ${SOURCE_DIR}/lib/avdevice.lib
    INTERFACE ${SOURCE_DIR}/lib/avfilter.lib
    INTERFACE ${SOURCE_DIR}/lib/avformat.lib
    INTERFACE ${SOURCE_DIR}/lib/avutil.lib
    INTERFACE ${SOURCE_DIR}/lib/postproc.lib
    INTERFACE ${SOURCE_DIR}/lib/swresample.lib
    INTERFACE ${SOURCE_DIR}/lib/swscale.lib
    )
unset(SOURCE_DIR)

ExternalProject_Get_Property(ffmpeg-shared-project SOURCE_DIR)
add_custom_target(ffmpeg_copy
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${SOURCE_DIR}/bin ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    )
unset(SOURCE_DIR)

add_dependencies(ffmpeg
    ffmpeg_copy
    )
message("CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")