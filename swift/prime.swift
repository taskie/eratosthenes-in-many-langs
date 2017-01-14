import Foundation

func sieve(size: Int) -> [Bool] {
    if size <= 1 { return Array<Bool>(count: size, repeatedValue: false) }
    var sieveArray = Array<Bool>(count: size, repeatedValue: true)
    sieveArray[0] = false
    sieveArray[1] = false
    let root = Int(sqrt(Double(size))) + 1
    for i in 2 ..< root {
	if sieveArray[i] {
	    for var j = i * i; j < sieveArray.count; j += i {
		sieveArray[j] = false
	    }
	}
    }
    return sieveArray
}

func countPrime(n: Int) -> Int {
    var counter = 0
    for isPrime in sieve(n + 1) {
	if isPrime { ++counter }
    }
    return counter
}

var n = 10000000
if C_ARGC >= 2 {
    if let arg = String.fromCString(C_ARGV[1])?.toInt() {
      	n = arg
    }
}
println(countPrime(n))
