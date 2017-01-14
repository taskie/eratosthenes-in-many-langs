import sys
import math
import numpy as np

def sieve(size):
    if n <= 1:
        return np.zeros(size, bool)
    sieveArray = np.ones(size, bool)
    sieveArray[:2] = False
    root = int(math.sqrt(size)) + 1
    for i in range(2, root):
        if not sieveArray[i]:
            continue
        sieveArray[i * i::i] = False
    return sieveArray

def countPrime(n):
    return np.count_nonzero(sieve(n + 1))

n = int(sys.argv[1]) if (len(sys.argv) >= 2) else 10000000
print(countPrime(n))
