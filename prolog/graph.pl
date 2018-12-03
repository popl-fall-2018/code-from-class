
dirEdge(a,b). dirEdge(a,c).
dirEdge(b,c). dirEdge(b,d). dirEdge(b,e).
dirEdge(c,d).

dirEdge(f,g). dirEdge(f,h).
dirEdge(g,h).

%% BAD:
%% dirEdge(X, Y) :- dirEdge(Y, X).

%% Try again, without recursion
edge(X, Y) :- dirEdge(Y, X).
edge(X, Y) :- dirEdge(X, Y).

%% path - series of nodes that are consecutively connected by edges in the graph

dirPath(Y, Y).
dirPath(X, Y) :- dirEdge(X, Z), dirPath(Z, Y).

%% BAD
%path(Y, Y).
%path(X, Y) :- edge(X, Z), path(Z, Y).


path(X, Y) :- pathNoRepeats(X, Y, [X]).

pathNoRepeats(X, X, _).
pathNoRepeats(X, Y, Checked) :-
    edge(X, Z),
    \+ member(Z, Checked),
    pathNoRepeats(Z, Y, [Z | Checked]).

% A graph is complete if every node in the graph is directly connected to every other node.

complete([]).
complete([N|V]) :-
    everyEdge(N, V),
    complete(V).


everyEdge(_, []).
everyEdge(N, [M|T]) :- edge(N, M),
		       everyEdge(N, T).
