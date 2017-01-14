def sieve(size)
  return Array.new(size, false) if size <= 1
  sieveArray = Array.new(size, true)
  sieveArray[0] = sieveArray[1] = false
  root = Math.sqrt(size).to_i + 1
  (2 ... root).each do |i|
    next if !sieveArray[i]
    (i * i).step(sieveArray.size - 1, i) do |j|
      sieveArray[j] = false
    end
  end
  return sieveArray
end

def countPrime(n)
  return sieve(n + 1).count{|x| x}
end

n = unless ($*.empty?) then $*.first.to_i else 10000000 end
puts(countPrime(n))