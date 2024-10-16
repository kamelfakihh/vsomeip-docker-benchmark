# Copyright (C) 2015-2017 Bayerische Motoren Werke Aktiengesellschaft (BMW AG)
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cmake_minimum_required (VERSION 2.8.7)
project (vSomeIPHelloWorld)

set (CMAKE_CXX_FLAGS "-O3 -std=c++0x")

find_package(vsomeip QUIET)
IF (NOT someip_FOUND)
    find_package(vsomeip3)
    IF (NOT vsomeip3_FOUND)
        MESSAGE(FATAL_ERROR "Could not locate vsomeip or vsomeip3")
    ENDIF ()
ENDIF ()

find_package( Boost COMPONENTS system thread log filesystem log_setup REQUIRED )

include_directories (
    ${Boost_INCLUDE_DIR}
    ${VSOMEIP_INCLUDE_DIRS}
)

add_compile_options(-fpermissive)

IF (NOT someip_FOUND)
    add_executable (hello_world_service hello_world_service_main.cpp ../common/bench_measurer.cpp)
    target_link_libraries(hello_world_service vsomeip3 ${CMAKE_THREAD_LIBS_INIT})
    add_executable (hello_world_client hello_world_client_main.cpp ../common/bench_measurer.cpp)
    target_link_libraries(hello_world_client vsomeip3 ${CMAKE_THREAD_LIBS_INIT})
ELSE ()
    add_executable (hello_world_service hello_world_service_main.cpp ../common/bench_measurer.cpp)
    target_link_libraries(hello_world_service vsomeip ${CMAKE_THREAD_LIBS_INIT})
    add_executable (hello_world_client hello_world_client_main.cpp ../common/bench_measurer.cpp)
    target_link_libraries(hello_world_client vsomeip ${CMAKE_THREAD_LIBS_INIT})
ENDIF ()