import os
import math
import strutils

proc prime(size: int) : seq[bool] =
  let n = size - 1
  var sieveArray = newSeq[bool](size)
  for i in 2 .. n: sieveArray[i] = true
  let root = sqrt(size.toFloat).toInt
  for i in 2 .. root:
    if not sieveArray[i]: continue
    for j in countup(i * i, n, i):
      sieveArray[j] = false
  result = sieveArray

proc countPrime(n: int) : int =
  for b in prime(n + 1):
    if b: result += 1

var n = 10000000
if paramCount() >= 1:
  n = paramStr(1).parseInt
echo(countPrime(n))
