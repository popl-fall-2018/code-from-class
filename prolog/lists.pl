
ourMember(X, [X|_]).
ourMember(X, [_|T]) :- ourMember(X, T).

ourAppend([], A, A).
ourAppend([H|T], A, [H|L]) :- ourAppend(T, A, L).



middleElement(List, Middle) :-
    append(X, [Middle|Y], List),
    length(X, TheLength),
    length(Y, TheLength).


% LastElement - lastElement(List, Element) should be true if Element is the last element of List

lastElement(List, Element) :-
    append(_, [Element], List).

% allButLast(List, AllBut) - true if AllBut is all of the list besides the last element.

allButLast(List, AllBut) :-
    append(AllBut, [_], List).
