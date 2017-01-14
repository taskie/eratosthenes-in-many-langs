import java.util.BitSet;

class Prime {
    static BitSet sieve(int size) {
        BitSet sieveArray = new BitSet(size);
        if (size <= 1) return sieveArray;
        sieveArray.set(2, size);
        int root = (int)Math.sqrt(size) + 1;
        for (int i = 2; i < root; ++i) {
            if (!sieveArray.get(i)) continue;
            for (int j = i * i; j < size; j += i) {
                sieveArray.clear(j);
            }
        }
        return sieveArray;
    }
    
    static int countPrime(int n) {
        return sieve(n + 1).cardinality();
    }
    
    public static void main(String[] args) {
        int n = (args.length >= 1) ? Integer.parseInt(args[0]) : 10000000;
        System.out.println(countPrime(n));
    }
}