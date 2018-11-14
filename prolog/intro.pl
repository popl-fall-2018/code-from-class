age(helmuth, 37).
age(trump, 72).
age(decker, 164).
age(elizabeth2, 92).

birthplace(helmuth, usa).
birthplace(helmuth, sweden).
birthplace(trump, usa).
birthplace(decker, usa).
birthplace(elizabeth2, england).

eligibleForPresident(X) :-
    birthplace(X, usa),
    age(X, A),
    A >= 35.

eligibleForPresident(trump).
eligibleForPresident(jeffrey).


mother(anita, claire).
mother(claire, janice).
mother(janice, laura).
mother(janice, zoe).
mother(janice, kendra).
mother(janice, francine).
mother(zoe, gertrude).
mother(francine, heather).

% This is a comment
ancestor(X, Y) :- mother(X, Y).
ancestor(X, Y) :- mother(X, Z), ancestor(Z, Y).


% Sister relation

sister(X, Y) :- mother(Mom, X), mother(Mom, Y), \+(Y = X).

% Prolog makes math hard

feetToInches(Feet, Inches) :- Inches is Feet * 12.
feetToInches(Feet, Inches) :- Feet is Inches / 12.
