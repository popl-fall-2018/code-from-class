
p(a, a).
p(X, Y) :- q(X), !, r(X, Y).
p(b, b).

q(c).
q(d).

r(c, g).
r(c, h).
r(d, z).


% Ex: max/3 max of two elements

max(X, Y, Y) :- X =< Y, !.
max(X, Y, X) :- X > Y.

% definitions:
% green cut - a cut that, when removed, does not change the answer given by prolog. May make the program more efficient by pruning unused search branches,
% red cut - a cut that changes the meaning of the program, pruning solutions.

% Note: red cuts are sometimes ok to use, but you must be careful

% Define a Fibonacci predicate

fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, X) :-
    N > 1,     % If this is here, green cut; otherwise red cuts
    Nminus1 is N - 1,
    Nminus2 is N - 2,
    fib(Nminus1, FibNMinus1),
    fib(Nminus2, FibNMinus2),
    X is FibNMinus1 + FibNMinus2.


halves(List, Half1, Half2) :-
    append(Half1, Half2, List),
    length(Half1, L),
    length(Half2, L).
halves(List, Half1, Half2) :-
    append(Half1, Half2, List),
    length(Half1, L1),
    length(Half2, L2),
    L2 =:= L1 + 1.


merge([], L, L) :- !.
merge(L, [], L) :- !.
merge([H1|T1], [H2|T2], [H1|Sorted]) :-
    H1 < H2,
    !,
    merge(T1, [H2|T2], Sorted).
merge([H1|T1], [H2|T2], [H2|Sorted]) :-
    H1 >= H2,
    merge([H1|T1], T2, Sorted).

mergeSort([], []).
mergeSort([X], [X]) :- !.
mergeSort(List, Sorted) :-
    halves(List, Half1, Half2),
    mergeSort(Half1, SortedHalf1),
    mergeSort(Half2, SortedHalf2),
    merge(SortedHalf1, SortedHalf2, Sorted).
