#include "ProgramGenerator.hpp"

ProgramNode* ProgramGenerator::generateProgram(std::string program) {
   yy_scan_string(program.c_str());
   yyparse();
   return (ProgramNode*) root;
}
