function sieve(size) {
    const sieveArray = new Uint8Array(size);
    for (let i = 2; i < size; ++i) { sieveArray[i] = 1; }
    const root = (Math.sqrt(size) | 0) + 1;
    for (let i = 2; i < root; ++i) {
        if (!sieveArray[i]) { continue; }
        for (let j = i * i; j < sieveArray.length; j += i) {
            sieveArray[j] = 0;
        }
    }
    return sieveArray;
}

function countPrime(n) {
    var sieveArray = sieve(n + 1);
    var count = 0;
    for (var i = 0; i < sieveArray.length; ++i) {
        if (sieveArray[i]) { ++count; }
    }
    return count;
}

const n = (process.argv.length >= 3) ? parseInt(process.argv[2]) : 10000000;
console.log(countPrime(n));
