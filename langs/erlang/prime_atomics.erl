-module(prime_atomics).
-export([main/1]).

sieve(Size) ->
    Arr = atomics:new(Size, [{signed, false}]),
    %% atomics index is 1-based; use index I+1 for logical index I
    %% 1 = prime, 0 = not prime (default)
    lists:foreach(fun(I) -> atomics:put(Arr, I + 1, 1) end, lists:seq(2, Size - 1)),
    Root = trunc(math:sqrt(Size)) + 1,
    sieve_loop(2, Root, Size, Arr),
    Arr.

sieve_loop(I, Root, Size, Arr) when I >= Root ->
    ok;
sieve_loop(I, Root, Size, Arr) ->
    case atomics:get(Arr, I + 1) of
        1 ->
            mark_composites(I * I, I, Size, Arr),
            sieve_loop(I + 1, Root, Size, Arr);
        0 ->
            sieve_loop(I + 1, Root, Size, Arr)
    end.

mark_composites(J, _Step, Size, _Arr) when J >= Size ->
    ok;
mark_composites(J, Step, Size, Arr) ->
    atomics:put(Arr, J + 1, 0),
    mark_composites(J + Step, Step, Size, Arr).

count_prime(N) ->
    Arr = sieve(N + 1),
    count_loop(0, N, Arr, 0).

count_loop(I, N, _Arr, Count) when I > N ->
    Count;
count_loop(I, N, Arr, Count) ->
    count_loop(I + 1, N, Arr, Count + atomics:get(Arr, I + 1)).

main([Arg]) ->
    N = list_to_integer(atom_to_list(Arg)),
    io:format("~B~n", [count_prime(N)]),
    halt(0);
main([]) ->
    io:format("~B~n", [count_prime(10000000)]),
    halt(0).
