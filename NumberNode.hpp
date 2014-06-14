#ifndef NUMBER_NODE_H
#define NUMBER_NODE_
#include "Node.hpp"

class NumberNode : public Node {
   public:
   NumberNode(int _number) : number(_number) { };
   int execute();

   private:
   int number;
};
#endif

