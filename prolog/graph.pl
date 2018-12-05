
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

%findall

vertices(VertsSorted) :-
    findall(X, edge(X, _), Verts),
    sort(Verts, VertsSorted).

edgesBad(V, Edges) :-
    findall(X, edge(V, X), Edges).

edges(V, Edges) :-
    bagof(X, edge(V, X), Edges).

degree(V, D) :-
    edges(V, E),
    length(E, D).

%% subset/2 - takes a list and is true if second argument is a sublist

subset([], []).
%% Include the first element
subset([H|T], [H|S]) :- subset(T, S).
%% Ignore first element
subset([_|T], S) :- subset(T, S).

allSubsets(List, SubsetsList) :-
    findall(S, subset(List, S), SubsetsList).


% maplist takes a predicate with 2 arguments, a list, and returns a result list where each element of the first list is passed as the first argument to the predicate, and the second argument return values are collected.


%% Find the shortest path between two nodes in the graph

pathList(X, Y, [X|Path]) :-
    pathNoRepeatsList(X, Y, [X], Path).

pathNoRepeatsList(X, X, _, []).
pathNoRepeatsList(X, Y, Checked, [Z|Path]) :-
    edge(X, Z),
    \+ member(Z, Checked),
    pathNoRepeatsList(Z, Y, [Z | Checked], Path).

allPaths(X, Y, Paths) :-
    bagof(Path , pathList(X, Y, Path), Paths).

shortestList(Lists, LengthShortest) :-
    maplist(length, Lists, ListLengths),
    min_list(ListLengths, LengthShortest).

shortestPath(X, Y, ShortestPath) :-
    allPaths(X, Y, Paths),
    shortestList(Paths, ShortestLength),
    member(ShortestPath, Paths),
    length(ShortestPath, ShortestLength).
