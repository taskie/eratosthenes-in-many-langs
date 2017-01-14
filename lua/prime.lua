function sieve(size)
    if size <= 0 then return {} end
    local sieveArray = {false}
    for i = 2, size do sieveArray[i] = true end
    local root = math.sqrt(size) + 1
    for i = 2, root do
        if sieveArray[i] then
            for j = i * i, size, i do
                sieveArray[j] = false
            end
        end
    end
    return sieveArray
end

function countPrime(n)
    if n == 0 then return 0 end
    local sieveArray = sieve(n)
    local count = 0
    for i, p in ipairs(sieveArray) do
         if p then count = count + 1 end
    end
    return count
end

n = #arg >= 1 and tonumber(arg[1]) or 10000000
print(countPrime(n))