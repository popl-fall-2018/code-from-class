
% To turn on Prolog highlighting in emacs, type:
% M-x (Meta + x)
% Type in `prolog-mode`, and hit return.

% To start SWI Prolog Interpreter:
% > swipl

% To load a file:
% ['intro'].

% Simple database
age(helmuth, 31).
age(trump, 71).
age(decker, 162).
age(elizabeth2, 91).

% Q: age(helmuth, 50).
% Q: age(helmuth, 31).
% Q: age(decker, Age).

% Q: age(Name, Age).

% Note: Can use the following commands:
% ; (or space) - gives next solution
% RET - stops

% Q: age(Name, Age), Age > 50.

birthplace(helmuth, usa).
birthplace(trump, usa).
birthplace(decker, usa).
birthplace(elizabeth2, england).

% Q: birthplace(Name, usa).

% ASK: How would we define a rule that describes who is eligible to be
%      president based on age and birthplace?

eligibleForPresident(X) :-
    birthplace(X, usa),
    age(X, Years),
    Years >= 35.

% Q: eligibleForPresident(helmuth).
% Q: eligibleForPresident(trump).
% Q: eligibleForPresident(elizabeth2).
% Q: eligibleForPresident(Name).

% Female Ancestory
mother(anita, claire).
mother(claire, janice).
mother(janice, laura).
mother(janice, zoe).
mother(zoe, gertrude).
mother(janice, kendra).
mother(janice, francine).
mother(francine, heather).

% Q: mother(Mother, Daughter).

% ASK: How would we define an ancestor relation? Who is an ancestor of whom?

ancestor(X, Y) :- mother(X,Y).
ancestor(X, Y) :- mother(X,Z), ancestor(Z,Y).

% Q: ancestor(X, heather).
% Q: ancestor(claire, A).

% ASK: How would we define a sister relationship?
% Leave off last part at first, see that a person is sister of self.
sister(X, Y) :- mother(Z, X), mother(Z,Y), \+(Y = X).

% Q: sister(laura, Sis).
% Q: sister(X, Y).  % Gives all pairs of sisters, both ways!
% Q: sister(laura, Sis), mother(Sis, Niece).

% Simple math is a bit difficult.
feetToInches(Feet, Inches) :- Inches is Feet * 12.

% Q: feetToInches(10, I).
% Q: feetToInches(X, 24). % Can't do this. Math only goes one way.
