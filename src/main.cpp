#include <iostream>
#include "../include/calculator.h"

int main() {
    Calculator calc;
    
    std::cout << "Simple Calculator Demo" << std::endl;
    std::cout << "10 + 5 = " << calc.add(10, 5) << std::endl;
    std::cout << "10 - 5 = " << calc.subtract(10, 5) << std::endl;
    std::cout << "10 * 5 = " << calc.multiply(10, 5) << std::endl;
    std::cout << "10 / 5 = " << calc.divide(10, 5) << std::endl;
    std::cout << "10 / 2 = " << calc.divide(10, 2) << std::endl;
    
    return 0;
} 