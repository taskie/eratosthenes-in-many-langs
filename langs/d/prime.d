import std.algorithm;
import std.conv;
import std.math;
import std.stdio;

bool[] sieve(int size) {
    bool[] sieveArray;
    sieveArray.length = size;
    if (size <= 1) return sieveArray;
    sieveArray[2 .. $].fill(true);
    int root = cast(int)sqrt(cast(double)size) + 1;
    foreach (i; 2 .. root) {
        if (!sieveArray[i]) continue;
        for (uint j = i * i; j < sieveArray.length; j += i) {
            sieveArray[j] = false;
        }
    }
    return sieveArray;
}

ulong countPrime(int n) {
    return sieve(n + 1).count(true);
}

void main(string[] args) {
    int n = (args.length >= 2) ? args[1].to!int : 10000000;
    writeln(countPrime(n));
}