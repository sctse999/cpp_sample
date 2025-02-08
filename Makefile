# Compiler settings
CXX = g++
CXXFLAGS = -Wall -std=c++11

# Directories
SRC_DIR = src
OBJ_DIR = obj
DATA_DIR = data

# Source and object files
SRC = $(SRC_DIR)/main.cpp
OBJ = $(OBJ_DIR)/main.o

# Target
MAIN_TARGET = main

# Create necessary directories first
all: create_dirs $(MAIN_TARGET)

# Create directories
create_dirs:
	mkdir -p $(OBJ_DIR)
	mkdir -p $(DATA_DIR)

# Main program
$(MAIN_TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $@

# Object file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean
clean:
	rm -rf $(OBJ_DIR) $(MAIN_TARGET)

.PHONY: all clean create_dirs 