#ifndef PROGRAM_NODE_H
#define PROGRAM_NODE_H

#include "Node.hpp"

class ProgramNode : public Node {
   private:
      Node* program;
   public:
      ProgramNode(Node* _program) : program(_program) { };
      int execute();
};

#endif

