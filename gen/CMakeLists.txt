cmake_minimum_required(VERSION 3.16)

project(gen)

add_executable(gen main.cpp)

# if (NOT CROSSCOMPILING)
#     export(TARGETS ${TARGET} FILE ${CMAKE_BINARY_DIR}/../ImportSwiftGenerator-${HOST}.cmake NAMESPACE native- )
# endif()

install(TARGETS gen
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)
