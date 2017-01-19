#include <errno.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool* sieve(int size) {
    bool* sieveArray = calloc(size, sizeof(bool));
    for (int i = 2; i < size; ++i) { sieveArray[i] = true; }
    int root = sqrt(size) + 1;
    for (int i = 2; i < root; ++i) {
        if (!sieveArray[i]) { continue; }
        for (int j = i * i; j < size; j += i) {
            sieveArray[j] = false;
        }
    }
    return sieveArray;
}

int countPrime(int n) {
    bool* sieveArray = sieve(n + 1);
    int count = 0;
    for (int i = 0; i <= n; ++i) {
        if (sieveArray[i]) { ++count; }
    }
    free(sieveArray);
    return count;
}

int main(int argc, char* argv[]) {
    int n = 10000000;
    if (argc > 1) {
        char *endptr;
        n = strtol(argv[1], &endptr, 0);
        if (n < 0 || *endptr != '\0' || errno) {
            exit(1);
        };
    }
    printf("%d\n", countPrime(n));
}
