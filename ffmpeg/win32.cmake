include(ExternalProject)

ExternalProject_Add(ffmpeg-dev-project
    PREFIX deps/ffmpeg-dev
    DOWNLOAD_NAME ffmpeg-3.4.1-win32-dev.zip
    DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}
    URL https://ffmpeg.zeranoe.com/builds/win32/dev/ffmpeg-3.4.1-win32-dev.zip
    URL_HASH SHA256=2cfc802561d68e58ba3185276d244eac3a6163998ab3ea9b8fa457b077a8d7c8
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)


ExternalProject_Add(ffmpeg-shared-project
    PREFIX deps/ffmpeg-shared
    DOWNLOAD_NAME ffmpeg-3.4.1-win32-shared.zip
    DOWNLOAD_DIR ${CMAKE_CURRENT_LIST_DIR}
    URL https://ffmpeg.zeranoe.com/builds/win32/shared/ffmpeg-3.4.1-win32-shared.zip
    URL_HASH SHA256=74628044181069d9ea9967a64c196418d1b1d04f724499845a2f36dbf1371d93
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)


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