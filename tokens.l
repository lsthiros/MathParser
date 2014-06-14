%{
#include <string>
#include "Node.hpp"
#include "BinaryFunctionNode.hpp"
#include "ProgramNode.hpp"
#include "parser.hpp"
#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() { }
%}

%%

[ \t\n]     ;
[0-9]+      SAVE_TOKEN; return TINTEGER;
"+"         return TOKEN(TPLUS);
"-"         return TOKEN(TMINUS);
"*"         return TOKEN(TMULT);
"/"         return TOKEN(TDIV);
"("         return TOKEN(TOPENPAREN);
")"         return TOKEN(TCLOSEPAREN);
.           printf("Invalid token: %s\n", yytext); yyterminate();

%%

