import java.util.BitSet

fun sieve(size: Int): BitSet {
    val sieveArray = BitSet(size)
    if (size <= 1) { return sieveArray }
    sieveArray.set(2, size)
    val root = Math.sqrt(size.toDouble()).toInt() + 1
    for (i in 2 until root) {
        if (!sieveArray[i]) { continue }
        for (j in (i * i) until size step i) {
            sieveArray.clear(j)
        }
    }
    return sieveArray
}

fun countPrime(n: Int): Int {
    return sieve(n + 1).cardinality()
}

fun main(args: Array<String>) {
    val n = if (args.size >= 1) { args[0].toInt() } else { 10000000 }
    println(countPrime(n))
}
