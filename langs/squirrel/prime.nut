function sieve(size) {
    if (size <= 1) return array(size, false);
    local sieveArray = array(size, true);
    sieveArray[0] = sieveArray[1] = false;
    local root = sqrt(size).tointeger() + 1;
    for (local i = 2; i < root; ++i) {
        if (!sieveArray[i]) continue;
        for (local j = i * i; j < sieveArray.len(); j += i) {
            sieveArray[j] = false;
        }
    }
    return sieveArray;
}

function countPrime(n) {
    return sieve(n + 1).filter(@(i, x) x).len();
}

local n = (vargv.len() >= 1) ? vargv[0].tointeger() : 10000000;
print(countPrime(n) + "\n");