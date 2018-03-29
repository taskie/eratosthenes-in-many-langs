import sys
import math

def sieve(size):
    if (n <= 1):
        return [False] * size
    sieve_array = [True] * size
    sieve_array[0] = sieve_array[1] = False
    root = int(math.sqrt(size)) + 1
    for i in range(2, root):
        if not sieve_array[i]:
            continue
        for j in range(i * i, size, i):
            sieve_array[j] = False
    return sieve_array

def count_prime(n):
    return sieve(n + 1).count(True)

n = int(sys.argv[1]) if (len(sys.argv) >= 2) else 10000000
print(count_prime(n))
