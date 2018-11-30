
%% Pre-lab

even(X) :- 0 =:= mod(X, 2).

even2(X) :- 0 is mod(X, 2).

even3(X) :- 0 is X mod 2.

squareList([], []).
squareList([H|T], [HSquared|TailResult]) :-
    squareList(T, TailResult),
    HSquared is H * H.

%% In Lab

% First problems

sum([], 0).
sum([H|T], S) :- sum(T, TailSum), S is TailSum + H.

average([], 0).
average(List, A) :- sum(List, S), length(List, C), A is S / C.

abs(X, X) :- X >= 0.
abs(X, NegX) :- X < 0, NegX is -X.

% Gallery Walk problems

range(X, X, [X]).
range(X, Y, [X|T]) :- X < Y,
		      Xplus1 is X + 1,
		      range(Xplus1, Y, T).


primeHelper(X, Div) :- Div >= X.
primeHelper(X, Div) :- 0 =\= mod(X, Div),
		       DivPlus1 is Div + 1,
		       primeHelper(X, DivPlus1).

prime(X) :- primeHelper(X, 2).


factorial(1, 1).
factorial(N, X) :- NMinus1 is N - 1,
		   factorial(NMinus1, Xm1fact),
		   X is Xm1fact * N.


multLists([], [], []).
multLists([H1|T1], [H2|T2], [Heads|Tails]) :-
    multLists(T1, T2, Tails),
    Heads is H1 * H2.

dotProduct(L1, L2, DP) :-
    multLists(L1, L2, Result),
    sum(Result, DP).


%% Cool alternative solution to prime from Josh and Amin
%% Uses range

primeHelperA(X, []).
primeHelperA(X, [H|T]) :- 
	X mod H =\= 0,
	primeHelperA(X, T).

primeA(X) :-
	OneBelow is X - 1,
	range(2, OneBelow, Range),
	primeHelperA(X, Range).
