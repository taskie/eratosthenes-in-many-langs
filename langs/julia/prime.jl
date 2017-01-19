function sieve(size)
    sieve_array = falses(size)
    if size <= 0
        return sieve_array
    end
    sieve_array[1] = true

    root = floor(Int, sqrt(size) + 1)
    @inbounds for i = 2 : root
        if !sieve_array[i]
            sieve_array[i * i : i : size] = true
        end
    end
    return sieve_array
end

function count_prime(n)
    return count(x -> !x, sieve(n))
end

n = 10000000
if length(ARGS) >= 1
    try
        n = parse(Int, ARGS[1])
    end
end
println(count_prime(n))
