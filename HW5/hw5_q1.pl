pythagorean(X, Y, Z) :- X*X + Y*Y =:= Z*Z, !.
pythagorean(X, Z, Y) :- X*X + Y*Y =:= Z*Z, !.
pythagorean(Z, Y, X) :- X*X + Y*Y =:= Z*Z.

:- use_module(library(clpfd)).
prime(1) :- !, fail.
prime(2) :- !.
prime(X) :- Z is X-1, Y in 2..Z, indomain(Y), X mod Y #=0 -> !, fail.
prime(_).

goldbach(_, _, Z) :- Z mod 2 #\=0 -> !, fail.
goldbach(_, _, Z) :- Z #= 2-> !, fail.
goldbach(X, Y, Z) :- K is Z-1, X in 2..K, indomain(X), Y is Z-X, prime(X), prime(Y).
