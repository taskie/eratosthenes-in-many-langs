def sieve(size) {
    sieveArray = new BitSet(size)
    if (size <= 1) { return sieveArray }
    sieveArray.set(2, size)
    root = (int)Math.sqrt(size) + 1
    for (i = 2; i < root; ++i) {
        if (!sieveArray.get(i)) { continue }
        for (j = i * i; j < size; j += i) {
            sieveArray.clear(j);
        }
    }
    sieveArray
}

def countPrime(n) {
    sieve(n + 1).cardinality()
}

n = (args.length >= 1) ? Integer.parseInt(args[0]) : 10000000
println(countPrime(n))
