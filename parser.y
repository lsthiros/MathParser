%{
#include <string>
#include "Node.hpp"
#include "BinaryFunctionNode.hpp"
#include "NumberNode.hpp"
#include "ProgramNode.hpp"

Node* root;
extern int yylex();
void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%union {
ProgramNode* programNode;
Node* listNode;
std::string* string;
int token;
}

%token <token> TOPENPAREN TCLOSEPAREN
%token <token> TPLUS TMINUS
%token <token> TMULT TDIV
%token <string> TINTEGER

%type <listNode> list
%type <programNode> program 

%left TPLUS TMINUS TMUL TDIV

%start program

%%

program : TOPENPAREN list TCLOSEPAREN {root = new ProgramNode($2);}
        ;

list    : list TPLUS TINTEGER {
            $$ = new BinaryFunctionNode(BinaryFunctionNode::Operation::addition,
               $1, new NumberNode(std::stoi(*$3)));
        }
        | list TMINUS TINTEGER {
            $$ = new BinaryFunctionNode(BinaryFunctionNode::Operation::subtraction,
               $1, new NumberNode(std::stoi(*$3)));
        }
        | list TMULT TINTEGER {
            $$ = new BinaryFunctionNode(BinaryFunctionNode::Operation::multiplication,
               $1, new NumberNode(std::stoi(*$3)));
        }
        | list TDIV TINTEGER {
            $$ = new BinaryFunctionNode(BinaryFunctionNode::Operation::division,
               $1, new NumberNode(std::stoi(*$3)));
        }
        | TINTEGER { $$ = new NumberNode(std::stoi(*$1));}
        ;

%%

