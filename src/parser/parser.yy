%skeleton "lalr1.cc"
%require "3.8.2"
%header

%define api.token.raw

%define api.token.constructor
%define api.value.type variant
%define parse.assert

%code requires {
    #include <string>
    #include <vector>

    class Driver;
}

%code {
    #include "../utility/Driver.hh"
}

%param { Driver& drv }

%locations

%define parse.trace
%define parse.error detailed
%define parse.lac full


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
    Function: KW_DEF IDENTIFIER PUNCT_LPAREN PUNCT_RPAREN { std::cout << "function defintion was found" << "\n"; }
%%

void yy::parser:error(const location_types& loc, const::string& message) {
    std::cerr << "Error at: " << loc << " Message: " << message << std::endl;
}