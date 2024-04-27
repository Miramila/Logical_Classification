% Define family relations
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.
brother_in_law(X, Y) :- brother(X, Z), spouse(Z, Y).
spouse(X, Y) :- married(X, Y); married(Y, X).
% Define the given relationships
invited(X) :- brother_in_law(X, chen); father(chen, Y), brother_in_law(Y, Z); brother(chen, Y), mother_in_law(Y, Z); brother_in_law(chen, X).
% Facts
male(chen).
female(mary).
male(john).
female(jane).
parent(adam, chen).
parent(eve, chen).
parent(chen, jane).
parent(chen, john).
parent(chen, adam).
parent(chen, eve).
married(adam, eve).
married(eve, adam).
married(chen, mary).
married(mary, chen).
