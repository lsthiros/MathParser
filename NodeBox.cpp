#include "NodeBox.hpp"

NodeBox::NodeBox(std::string _nodeName, std::string _value) :
   RectangleShape(sf::Vector2f(100, 100)) {
   nodeName = _nodeName;
   value = _value;

   this->setFillColor(sf::Color(0,0,0));
   this->setOutlineThickness(3);
   this->setOutlineColor(sf::Color(250,250,250));
}

