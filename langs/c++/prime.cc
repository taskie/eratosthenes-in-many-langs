#include <algorithm>
#include <iostream>
#include <iterator>
#include <stdexcept>
#include <string>
#include <vector>
#include <cmath>
#include <cstdlib>

std::vector<bool> sieve(int size) {
    std::vector<bool> sieveArray(size, true);
    for (int i = 0; i < std::min(2, size); ++i) { sieveArray[i] = false; }
    int root = std::sqrt(size) + 1;
    for (int i = 2; i < root; ++i) {
        if (!sieveArray[i]) { continue; }
        for (int j = i * i; j < size; j += i) {
            sieveArray[j] = false;
        }
    }
    return sieveArray;
}

int countPrime(int n) {
    std::vector<bool> sieveArray = sieve(n + 1);
    return std::count(sieveArray.begin(), sieveArray.end(), true);
}

int main(int argc, char* argv[]) {
    int n = 10000000;
    if (argc > 1) {
        std::string arg = argv[1];
        std::size_t endidx;
        try {
            n = std::stoi(arg, &endidx, 0);
            if (std::next(arg.begin(), endidx) != arg.end()) {
                throw std::invalid_argument("");
            }
            if (n < 0) { throw std::out_of_range(""); }
        } catch (...) {
            std::exit(1);
        }
    }
    std::cout << countPrime(n) << std::endl;
}
