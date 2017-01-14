using System;

class Prime {
    static bool[] Sieve(int size) {
    	bool[] sieveArray = new bool[size];
    	for (int i = 2; i < size; ++i) { sieveArray[i] = true; }
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
    	int count = 0;
    	foreach (bool x in Sieve(n + 1)) {
    		if (x) ++count;
    	}
        return count;
    }

    static void Main(string[] args) {
        int n = (args.Length >= 1) ? Int32.Parse(args[0]) : 10000000;
        Console.WriteLine(CountPrime(n));
    }
}
