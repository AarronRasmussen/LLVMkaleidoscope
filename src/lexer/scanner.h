#pragma once

#if ! defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "../parser/location.hh"
#include "../parser/parser.hpp"

#include <string>

namespace yy {
    class Scanner : public yyFlexLexer {
    public:
        using yyFlexLexer::yyFlexLexer;

        Scanner(std::istream& arg_yyin, std::ostream& arg_yyout)
            : yyFlexLexer(arg_yyin, arg_yyout) {}

        virtual ~Scanner() {};

        int lex(Parser::semantic_type* yylval);
        int lex();

        void initialize_location(yy::location::filename_type &f, yy::location::counter_type l = 1,
                                 yy::location::counter_type c = 1) {
            loc.initialize(&f, l, c);
        }

        yy::Parser::symbol_type scan();

    private:
        yy::location loc;
    };
}

#undef YY_DECL
#define YY_DECL yy::Parser::symbol_type yy::Scanner::scan()