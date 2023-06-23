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



