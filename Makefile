# Copyright (c) 2014 Louie Thiros

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

# Mothafuggin colahs
COLOR_NONE=\x1b[0m
COLOR_GREEN=\x1b[32;01m
COLOR_YELLOW=\x1b[33;01m
COLOR_RED=\x1b[31;01m

# Compiler variables
CC = g++
CC_FLAGS = -g -std=c++11

# Project variables
EXECUTABLE_NAME = LexTest
SOURCES = NumberNode.cpp BinaryFunctionNode.cpp ProgramNode.cpp parser.cpp tokens.cpp NodeBox.cpp ProgramGenerator.cpp main.cpp
LEXER_DEF = tokens.l
PARSER_DEF = parser.y
EXT_LIB = sfml-graphics sfml-window sfml-system

# Generated variables (Don't change these)
LIBFLAGS = $(addprefix -l, $(EXT_LIB))
OBJECTS = $(SOURCES:.cpp=.o)
GENERATED_LEXER = $(LEXER_DEF:.l=.cpp)
GENERATED_PARSER = $(PARSER_DEF:.y=.cpp)
GENERATED_PARSER_HEADER = $(PARSER_DEF:.y=.hpp)

all : $(EXECUTABLE_NAME)

$(EXECUTABLE_NAME) : $(OBJECTS)
	@echo -en "$(COLOR_RED)Linking Objects\n$(COLOR_NONE)"
	$(CC) $(CC_FLAGS) $(OBJECTS) $(LIBFLAGS) -o $(EXECUTABLE_NAME)

$(GENERATED_PARSER) : $(PARSER_DEF)
	@echo -en "$(COLOR_YELLOW)Generating Parser\n$(COLOR_NONE)"
	bison -d -o $(GENERATED_PARSER) $(PARSER_DEF)

$(GENERATED_LEXER) : $(LEXER_DEF) $(GENERATED_PARSER)
	@echo -en "$(COLOR_YELLOW)Generating Lexer\n$(COLOR_NONE)"
	lex --header-file=$(LEXER_DEF:.l=.h) -o $(GENERATED_LEXER) $(LEXER_DEF) 

%.o : %.cpp
	@echo -en "$(COLOR_GREEN)Compiling $<\n$(COLOR_NONE)"
	$(CC) $(CC_FLAGS) -c $< -o $@

clean:
	rm -rf $(OBJECTS) $(EXECUTABLE_NAME) $(GENERATED_PARSER) $(GENERATED_PARSER_HEADER) $(GENERATED_LEXER)

