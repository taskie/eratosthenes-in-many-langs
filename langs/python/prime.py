import sys
import math

def sieve(size):
    if (n <= 1):
        return [False] * size
    sieveArray = [True] * size
    sieveArray[0] = sieveArray[1] = False
    root = int(math.sqrt(size)) + 1
    for i in range(2, root):
        if not sieveArray[i]:
            continue
        for j in range(i * i, len(sieveArray), i):
            sieveArray[j] = False
    return sieveArray

def countPrime(n):
    return sieve(n + 1).count(True)

n = int(sys.argv[1]) if (len(sys.argv) >= 2) else 10000000
print(countPrime(n))