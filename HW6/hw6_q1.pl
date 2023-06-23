
add(bot, bot, bot) :- !.
add(s(R), L, s(V)) :- add(R, L, V), !.
add(bot, s(L), s(V)) :- add(bot, L, V), !.

multiply(bot, _, bot).
multiply(_, bot, bot).
multiply(s(R), s(L), Res) :- multiply(s(R), L, Mul), add(s(R), Mul, Res), ! ; multiply(R, s(L), Mul), add(s(L), Mul, Res), !.

power(bot, _, bot).
power(_, bot, s(bot)).
power(s(R), s(L), Res) :- power(s(R), L, Pow), multiply(s(R), Pow, Res), !.
