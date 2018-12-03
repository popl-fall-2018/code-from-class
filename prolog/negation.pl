inNewYork(clinton).
inNewYork(utica).

%inNewYork(X) :- NewYork = [syracuse, utica, nyc],
%		member(X, NewYork).


outsideNewYork(X) :- \+ inNewYork(X).


hamiltonLocation(clinton).
