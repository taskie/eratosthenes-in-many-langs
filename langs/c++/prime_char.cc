#include <algorithm>
#include <iostream>
#include <iterator>
#include <stdexcept>
#include <string>
#include <vector>
#include <cmath>
#include <cstdlib>

std::vector<char> sieve(int size) {
  std::vector<char> sieveArray(size);
  if (size <= 0) return sieveArray;
  sieveArray[0] = 1;
  if (size <= 1) return sieveArray;
  sieveArray[1] = 1;
  int root = std::sqrt(size) + 1;
  for (int i = 2; i < root; ++i) {
    if (!sieveArray[i]) {
      for (int j = i * i; j < size; j += i) {
	sieveArray[j] = 1;
      }
    }
  }
  return sieveArray;
}

int countPrime(int n) {
  std::vector<char> sieveArray = sieve(n + 1);
  return std::count(sieveArray.begin(), sieveArray.end(), 0);
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
