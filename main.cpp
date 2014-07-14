#include <string>
#include <iostream>
#include "Node.hpp"
#include "tokens.h"

#include "ProgramGenerator.hpp"

int main(int argc, char** argv) {

   ProgramNode* programRoot = ProgramGenerator::generateProgram(
         "(1 + 2 + 3)");
   std::cout << programRoot->execute() << std::endl;
}
