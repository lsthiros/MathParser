#ifndef BINARY_FUNCTION_NODE_H
#define BINARY_FUNCTION_NODE_H
#include "Node.hpp"

class BinaryFunctionNode : public Node {

   public:
   enum Operation {
      addition,
      subtraction,
      multiplication,
      division
   };
   BinaryFunctionNode(BinaryFunctionNode::Operation _type, Node* _lhs, Node* _rhs) :
      type(_type),
      rhs(_rhs),
      lhs(_lhs) { };

   int execute();

   private:
   Operation type;
   Node* rhs;
   Node* lhs;
};
#endif

