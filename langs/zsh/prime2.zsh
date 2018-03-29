set -eu

count_prime () {
    local -i size=$1
    shift
    if (( size <= 0 )); then
        return
    fi
    local -a sieve_array=(0)
    for (( i=2; i <= size; ++i )); do (( sieve_array[i]=1 )); done
    local -i root
    root=$(( size ** 0.5 + 1 ))
    for (( i=2; i <= root; ++i ))
    do
        if ! (( sieve_array[i] )); then continue; fi
        for (( j=$((i * i)); j <= size; j+=i ))
        do
            (( sieve_array[j]=0 )) || :
        done
    done

    local -i count=0
    for (( i=1; i <= size; ++i ))
    do
        if (( sieve_array[i] )); then
            (( ++count ))
        fi
    done
    echo $count
}

declare -i n=${1:-10000000}
count_prime $n
