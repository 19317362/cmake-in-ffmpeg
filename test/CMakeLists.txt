
set(TARGET_NAME videogen)
add_executable(${TARGET_NAME}
    videogen.c
    )
target_link_libraries(${TARGET_NAME}
    ffmpeg
    )
add_test(${TARGET_NAME} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${TARGET_NAME})
