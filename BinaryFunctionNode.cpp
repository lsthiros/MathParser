#include "BinaryFunctionNode.hpp"

int BinaryFunctionNode::execute() {
   switch(type) {
      case Operation::addition:
         return lhs->execute() + rhs->execute();
         break;
      case Operation::subtraction:
         return lhs->execute() - rhs->execute();
         break;
      case Operation::multiplication:
         return lhs->execute() * rhs->execute();
         break;
      case Operation::division:
         return lhs->execute() / rhs->execute();
         break;
   }
}

