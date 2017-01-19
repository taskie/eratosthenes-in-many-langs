function sieve(size) {
    var sieveArray = new Uint8Array(size);
    for (var i = 2; i < size; ++i) { sieveArray[i] = 1; }
    var root = (Math.sqrt(size) | 0) + 1;
    for (var i = 2; i < root; ++i) {
        if (!sieveArray[i]) { continue; }
        for (var j = i * i; j < sieveArray.length; j += i) {
            sieveArray[j] = 0;
        }
    }
    return sieveArray;
}

function countPrime(n) {
    return sieve(n + 1).reduce((sum, x) => sum + x);
}

var n = (process.argv.length >= 3) ? parseInt(process.argv[2]) : 10000000;
console.log(countPrime(n));
