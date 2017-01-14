using System;
using System.Linq;

class Prime {
    static bool[] Sieve(int size) {
        if (size <= 1) return Enumerable.Repeat(false, size).ToArray();
        bool[] sieveArray = Enumerable.Repeat(true, size).ToArray();
        sieveArray[0] = sieveArray[1] = false;
        int root = (int)Math.Sqrt(size) + 1;
        for (int i = 2; i < root; ++i) {
            if (!sieveArray[i]) continue;
            for (int j = i * i; j < size; j += i) {
                sieveArray[j] = false;
            }
        }
        return sieveArray;
    }
    
    static int CountPrime(int n) {
        return Sieve(n + 1).Count(x => x);
    }

    static void Main(string[] args) {
        int n = (args.Length >= 1) ? Int32.Parse(args[0]) : 10000000;
        Console.WriteLine(CountPrime(n));    
    }
}