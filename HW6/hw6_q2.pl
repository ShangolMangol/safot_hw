:- [hw5_q2].

assert_degree(graph(G), S, Root, D) :- length(G, N), X in 1..N, indomain(X), \+ member(X, S)
                                , edge(graph(G), X, Root) -> D is 0, !.
assert_degree(graph(_), _, _, 1).

find_root(graph(G), S, Root) :- length(G, N), X in 1..N, indomain(X), \+ member(X, S)
                                , assert_degree(graph(G), S, X, D), D is 1, Root is X.

topological_sort_aux(graph(G), _, Q) :- length(G, N), length(Q, N).
topological_sort_aux(graph(G), S, Q) :- find_root(graph(G), Q, Root), append(Q, [Root], QN)
                                , topological_sort_aux(graph(G), SN, QN), append([Root],SN, S).

topological_sort(graph(G), S) :- topological_sort_aux(graph(G), S, []), length(G, N), length(S, N).

already_in(X, [[X|_]|_]) :- !.
already_in(X, [[_|Xs]|Q]) :- already_in(X, [Xs|Q]).
already_in(X, [_|Q]) :- already_in(X, Q).

get_scc(graph(G), _, [], I) :- length(G,N), I is N+1, !.
get_scc(graph(G), Root, SCC, I) :- length(G, N), X in I..N, indomain(X), path(graph(G), Root, X, _)
                                    , path(graph(G), X, Root, _) ->  Y is X+1,
                                    get_scc(graph(G), Root, SCCN, Y), append([X], SCCN, SCC).

get_scc_outer(graph(G), Root, SCC) :- get_scc(graph(G), Root, SCC, 1), ! ; append([], [Root], SCC).


scc_aux(graph(G), S, Q) :- length(G,N), X in 1..N, indomain(X), \+ already_in(X, Q) -> get_scc_outer(graph(G), X, SCC), 
                            append(Q, [SCC], QN), scc_aux(graph(G), SN, QN), append([SCC], SN, S).
scc_aux(graph(_), [], _) :- !.

scc(graph(G), S) :- scc_aux(graph(G), S, []).
