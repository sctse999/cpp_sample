# Compiler settings
CXX = g++
CXXFLAGS = -Wall -std=c++11

# Directories
SRC_DIR = src
TEST_DIR = test
OBJ_DIR = obj
INCLUDE_DIR = include

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
TEST_OBJS = $(TEST_SRCS:$(TEST_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Exclude main.o from test build
MAIN_OBJ = $(OBJ_DIR)/main.o
LIB_OBJS = $(filter-out $(MAIN_OBJ), $(OBJS))

# Targets
MAIN_TARGET = calculator
TEST_TARGET = run_tests

all: $(MAIN_TARGET)

# Main program
$(MAIN_TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@

# Test program
$(TEST_TARGET): $(TEST_OBJS) $(LIB_OBJS)
	$(CXX) $^ -o $@

# Object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

$(OBJ_DIR)/%.o: $(TEST_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $@

# Clean
clean:
	rm -rf $(OBJ_DIR) $(MAIN_TARGET) $(TEST_TARGET)

# Build and run tests
test: $(TEST_TARGET)
	./$(TEST_TARGET)

.PHONY: all clean test 