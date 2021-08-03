cmake_minimum_required(VERSION 3.15)
project(mappy C)

add_executable(mappy
    external.h
    external.c

    dlsym.c

    main.c
)
