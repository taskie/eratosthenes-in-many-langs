import sys
import math
import numpy as np

def sieve(size):
    if n <= 1:
        return np.zeros(size, bool)
    sieve_array = np.ones(size, bool)
    sieve_array[:2] = False
    root = int(math.sqrt(size)) + 1
    for i in range(2, root):
        if not sieve_array[i]:
            continue
        sieve_array[i * i::i] = False
    return sieve_array

def count_prime(n):
    return np.count_nonzero(sieve(n + 1))

n = int(sys.argv[1]) if (len(sys.argv) >= 2) else 10000000
print(count_prime(n))
