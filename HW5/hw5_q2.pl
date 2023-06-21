:- use_module(library(clpfd)).

check_node([], _).
check_node([X|Xs], N) :- X =< N, X >= 1, check_node(Xs, N), number(X).

check_valid([], _).
check_valid([X|Xs], N) :- check_node(X, N), check_valid(Xs, N). 

legal_graph(graph([])) :- !, fail.
legal_graph(graph(L)) :- length(L, N), check_valid(L, N).


edge(graph(L), X, Y) :- legal_graph(graph(L)), nth1(X, L, U), member(Y, U).

not_member(_, []) :- !.
not_member(X, [X|_]) :- !, fail.
not_member(X, [_|Ys]) :- not_member(X, Ys).


inner_path(graph(L), X, X, [X], _) :- legal_graph(graph(L)), !.
inner_path(graph(L), X, Y, [X, Y], _) :- edge(graph(L), X, Y), !.
inner_path(graph(L), X, Y, [X| [Z |Zs]], Q) :- edge(graph(L), X, Z), not_member(Z, Q), inner_path(graph(L), Z, Y, [Z|Zs], [Z|Q]), !.

path(graph(L), X, Y, P) :- legal_graph(graph(L)), inner_path(graph(L), X, Y, P, [X]).

circle(graph(L), P) :- length(L, N), X in 1..N, indomain(X), Y in 1..N, indomain(Y), Y#\=X, edge(graph(L), X, Y), path(graph(L), Y, X, Ps), append([X], Ps, P).

dag(graph(L)) :- legal_graph(graph(L)), not(circle(graph(L), _)).

