//
// Created by Aarron on 5/25/2025.
//

#include "Driver.h"
Driver::Driver() :  trace_scanning(false), trace_parsing(false) {

}

int Driver::parse(const std::string &f) {
    file = f;
    location.initialize(&file);
    scan_begin();
    yy::parser parse(*this);
    parse.set_debug_level(trace_parsing);
    int res = parse();
    scan_end();
    return res;
}