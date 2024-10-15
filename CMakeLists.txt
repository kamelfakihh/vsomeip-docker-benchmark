project(vsomeip-benchmark)
cmake_minimum_required (VERSION 2.8.1)

set (CMAKE_CXX_FLAGS "-O3 -std=c++0x")

# find_package (vsomeip 3.4.10 REQUIRED)
find_package (vsomeip REQUIRED)
find_package( Boost COMPONENTS system thread log filesystem log_setup REQUIRED )

include_directories (
    ${Boost_INCLUDE_DIR}
    ${VSOMEIP_INCLUDE_DIRS}
)

add_compile_options(-fpermissive)

add_executable(bench_request_response_client common/bench_measurer.cpp request_response/bench_request_response_client.cpp)
target_link_libraries(bench_request_response_client vsomeip ${Boost_LIBRARIES})

add_executable(bench_request_response_service common/bench_measurer.cpp request_response/bench_request_response_service.cpp)
target_link_libraries(bench_request_response_service vsomeip ${Boost_LIBRARIES})