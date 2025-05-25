cmake_minimum_required(VERSION 3.22.1)
project(LLVMKaleidoscope)

set(CMAKE_CXX_STANDARD 20)

find_package(BISON required)
find_package(FLEX required)

include(FetchContent)
FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)

add_custom_command(
        COMMAND bison -d -o parser/parser.cpp parser/parser.yy
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/src/parser/KXI2022_parser.yy
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/parser/KXI2022_parser.cpp
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/
        COMMENT "Generating parser.cpp"
)

add_custom_command(
        COMMAND flex --outfile lexer/lexer.cpp lexer/lexer.lex
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/src/lexer/lexer.lex
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/lexer/lexer.cpp
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src/
        COMMENT "Generating lexer.cpp"
)

add_custom_target(generate ALL
        DEPENDS parser/parser.cpp lexer/lexer.cpp
)

add_executable(LLVMKaleidoscope main.cpp
        parser/parser.cpp
        utility/Driver.cpp
        utility/Driver.h)


set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()
add_executable(
        Compiler_test
        tests/hello_test.cpp
)

target_link_libraries(
        Compiler_test
        GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(Compiler_test)