-module(prime).
-export([main/1]).

sieve(Size) ->
    Array = array:new(Size, {default, true}),
    Array1 = array:set(0, false, array:set(1, false, Array)),
    Root = trunc(math:sqrt(Size)) + 1,
    sieve_loop(2, Root, Size, Array1).

sieve_loop(I, Root, Size, Array) when I >= Root ->
    Array;
sieve_loop(I, Root, Size, Array) ->
    case array:get(I, Array) of
        true ->
            Array1 = mark_composites(I * I, I, Size, Array),
            sieve_loop(I + 1, Root, Size, Array1);
        false ->
            sieve_loop(I + 1, Root, Size, Array)
    end.

mark_composites(J, _Step, Size, Array) when J >= Size ->
    Array;
mark_composites(J, Step, Size, Array) ->
    mark_composites(J + Step, Step, Size, array:set(J, false, Array)).

count_prime(N) ->
    Array = sieve(N + 1),
    lists:sum([case array:get(I, Array) of true -> 1; false -> 0 end
               || I <- lists:seq(0, N)]).

main([Arg]) ->
    N = list_to_integer(atom_to_list(Arg)),
    io:format("~B~n", [count_prime(N)]),
    halt(0);
main([]) ->
    io:format("~B~n", [count_prime(10000000)]),
    halt(0).
