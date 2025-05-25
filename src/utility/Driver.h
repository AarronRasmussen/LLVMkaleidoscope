//
// Created by Aarron on 5/25/2025.
//

#ifndef LLVMKALEIDOSCOPE_DRIVER_H
#define LLVMKALEIDOSCOPE_DRIVER_H

#include <string>

#include "../parser/parser.hpp"

# define YY_DECL \
    yy::parser::symbol_type yylex(Driver& drv)
YY_DECL;

class Driver {
public:
    Driver();

    std::string file;
    bool trace_parsing;
    bool trace_scanning;

    yy::location location;

    int parse(const std::string& f);
    void scan_begin();
    void scan_end();
};


#endif //LLVMKALEIDOSCOPE_DRIVER_H
