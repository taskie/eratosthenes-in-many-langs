object Prime {
   def sieve(size: Int): Array[Boolean] = {
      if (size <= 1) return Array.fill(size)(false)
      val sieveArray = Array.fill(size)(true)
      sieveArray(0) = false
      sieveArray(1) = false
      val root = math.sqrt(size).toInt + 1
      for (i <- 2 until root) {
         if (sieveArray(i)) {
            for (j <- (i * i) until sieveArray.length by i) {
               sieveArray(j) = false
            }
         }
      }
      return sieveArray
   }
   
   def countPrime(n: Int): Int = {
      return sieve(n + 1).count(x => x)
   }
   
   def main(args: Array[String]) = {
      var n = if (args.length >= 1) args(0).toInt else 10000000
      println(countPrime(n))
   }
}