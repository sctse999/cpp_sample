#include <iostream>
#include <cassert>
#include <fstream>
#include <string>
#include "../include/calculator.h"

void test_calculator() {
    Calculator calc;
    
    // Test addition
    assert(calc.add(2, 3) == 5);
    assert(calc.add(-1, 1) == 0);
    
    // Test subtraction
    assert(calc.subtract(5, 3) == 2);
    assert(calc.subtract(1, 1) == 0);
    
    // Test multiplication
    assert(calc.multiply(4, 3) == 12);
    assert(calc.multiply(-2, 3) == -6);
    
    // Test division
    assert(calc.divide(6, 2) == 3.0f);
    assert(calc.divide(5, 2) == 2.5f);
    
    std::cout << "All tests passed!" << std::endl;
}

void test_from_file(const std::string& filename) {
    Calculator calc;
    std::ifstream file(filename);
    
    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }

    std::string num1, operation, num2;
    while (file >> num1 >> operation >> num2) {
        float a = std::stof(num1);
        float b = std::stof(num2);
        float result;

        if (operation == "+") {
            result = calc.add(a, b);
        } else if (operation == "-") {
            result = calc.subtract(a, b);
        } else if (operation == "*") {
            result = calc.multiply(a, b);
        } else if (operation == "/") {
            result = calc.divide(a, b);
        }

        std::cout << num1 << " " << operation << " " << num2 << " = " << result << std::endl;
    }

    file.close();
}

int main() {
    // Run basic tests
    test_calculator();

    // Run tests from input files
    std::cout << "\nTesting from file 1:" << std::endl;
    test_from_file("test/input/test_case_1.txt");
    
    std::cout << "\nTesting from file 2:" << std::endl;
    test_from_file("test/input/test_case_2.txt");

    return 0;
} 