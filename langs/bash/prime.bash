set -eu

sieve () {
    local -i size=$1
    shift
    if (( size <= 1 )); then
        for (( i=0; i<size; ++i )); do echo 0; done
        return
    fi
    local -a sieve_array=(0 0)
    for (( i=2; i < size; ++i )); do (( sieve_array[i]=1 )); done
    local -i root
    root=$(( $(echo "sqrt($size)" | bc) + 1 ))
    for (( i=2; i < root; ++i ))
    do
        if ! (( sieve_array[i] )); then continue; fi
        for (( j=$((i * i)); j < size; j+=i ))
        do
            (( sieve_array[j]=0 )) || :
        done
    done

    local -i count=0
    for (( i=0; i < size; ++i ))
    do
        echo ${sieve_array[i]}
    done
}

count_prime () {
    local -i n=$1
    sieve $((n + 1)) | grep -F 1 | wc -l

}

declare -i n=${1:-10000000}
count_prime $n
