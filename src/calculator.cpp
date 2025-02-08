#include "../include/calculator.h"

int Calculator::add(int a, int b) {
    return a + b;
}

int Calculator::subtract(int a, int b) {
    return a - b;
}

int Calculator::multiply(int a, int b) {
    return a * b;
}

float Calculator::divide(int a, int b) {
    if (b == 0) {
        throw "Division by zero error";
    }
    return static_cast<float>(a) / b;
} 