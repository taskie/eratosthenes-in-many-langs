#include <algorithm>
#include <iostream>
#include <iterator>
#include <string>
#include <vector>
#include <cmath>

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
    int n = (argc >= 2) ? std::stoi(argv[1]) : 10000000;
    std::cout << countPrime(n) << std::endl;
}
