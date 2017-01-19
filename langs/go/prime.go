package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
)

func sieve(size int) (sieveArray []bool) {
	sieveArray = make([]bool, size)
	for i := 2; i < size; i++ {
		sieveArray[i] = true
	}
	root := int(math.Sqrt(float64(size))) + 1
	for i := 2; i < root; i++ {
		if sieveArray[i] {
			for j := i * i; j < size; j += i {
				sieveArray[j] = false
			}
		}
	}
	return
}

func countPrime(n int) (count int) {
	count = 0
	for _, v := range sieve(n + 1) {
		if v {
			count++
		}
	}
	return
}

func main() {
	n := 10000000
	if len(os.Args) >= 2 {
		i, err := strconv.Atoi(os.Args[1])
		if err == nil {
			n = i
		}
	}
	fmt.Println(countPrime(n))
}
