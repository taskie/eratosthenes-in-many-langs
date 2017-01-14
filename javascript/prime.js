function sieve(size) {
    if (size <= 0) return [];
    if (size == 1) return [false];
    var sieveArray = new Array(size);
    sieveArray[0] = sieveArray[1] = false;
    for (var i = 2; i < size; ++i) sieveArray[i] = true;
    var root = (Math.sqrt(size) | 0) + 1;
    for (var i = 2; i < root; ++i) {
        if (!sieveArray[i]) continue;
        for (var j = i * i; j < sieveArray.length; j += i) {
            sieveArray[j] = false;
        }
    }
    return sieveArray;
}

function countPrime(n) {
    var sieveArray = sieve(n + 1);
    var count = 0;
    for (var i = 0; i < sieveArray.length; ++i) {
        if (sieveArray[i]) ++count;
    }
    return count;
}

var n = (process.argv.length >= 3) ? parseInt(process.argv[2]) : 10000000;
console.log(countPrime(n));