#include <iostream>

class Calculator {
public:
    int add(int a, int b) {
        return a + b;
    }

    int subtract(int a, int b) {
        return a - b;
    }

    int multiply(int a, int b) {
        return a * b;
    }

    float divide(int a, int b) {
        if (b == 0) {
            throw "Division by zero error";
        }
        return static_cast<float>(a) / b;
    }
};

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