%{
    #include <iostream>
    #include <string>
    #include <FlexLexer.h>
%}
%skeleton "lalr1.cc"
%require "3.8.2"
%header
%language "c++"

%define api.parser.class {Parser}
%define api.value.type variant
%define api.token.raw
%define api.token.constructor

%define parse.assert
%define parse.trace
%define parse.error detailed
%define parse.lac full

%locations

%parse-param { yy::Scanner* scanner}

%code requires {
    namespace yy {
        class Scanner;
    }
}

%code {
    #include "../lexer/scanner.h"
    #define yylex(x) scanner->lex(x)
}

%token <int> NUM_LIT;
%token <std::string> CHAR_LIT;
%token <std::string> STRING_LIT;
%token <std::string> IDENTIFIER;

%token <std::string> KW_DEF;
%token <std::string> KW_IF;
%token <std::string> KW_THEN;
%token <std::string> KW_ELSE;

%token <std::string> PUNCT_LPAREN;
%token <std::string> PUNCT_RPAREN;

%printer { yyo << $$; } <*>;

%%
    Function: KW_DEF IDENTIFIER PUNCT_LPAREN PUNCT_RPAREN { std::cout << "function definition was found" << "\n"; }
%%

void yy::Parser::error(const location_type& loc, const std::string& message) {
    std::cout << "Error at: " << loc << " Message: " << message << std::endl;
}