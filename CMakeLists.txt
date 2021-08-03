cmake_minimum_required(VERSION 3.15)
project(mappy C)

add_custom_command(
    OUTPUT ${CMAKE_BINARY_DIR}/dlsym.c
    COMMAND gperf.exe -L ANSI-C -t -N mappyLookup ${CMAKE_CURRENT_SOURCE_DIR}/dlsym.gperf --output-file=${CMAKE_BINARY_DIR}/dlsym.c
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/dlsym.gperf
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_executable(mappy
    external.h
    external.c

    main.c

    ${CMAKE_BINARY_DIR}/dlsym.c
)
