#ifndef NODE_BOX_H
#define NODE_BOX_H

#include <string>
#include <SFML/Graphics/RectangleShape.hpp>

class NodeBox : public sf::RectangleShape {
   private:
      std::string nodeName;
      std::string value;
   public:
      NodeBox(std::string nodeName, std::string value);
};

#endif
