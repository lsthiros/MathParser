#ifndef PROGRAM_GENERATOR_H
#define PROGRAM_GENERATOR_H

#include <string>

#include "ProgramNode.hpp"
#include "tokens.h"

extern int yyparse();
extern Node* root;

class ProgramGenerator {
   private :
      ProgramGenerator() { };
   public:
      static ProgramNode* generateProgram(std::string program);
};

#endif

