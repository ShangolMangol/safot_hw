use "hw3_q1_def.sml";

fun mapState f s = foldr (fn (x, acc) => (map f x)::acc) [] s;

fun toString lst = foldr (fn (x, acc) => (Char.toString x)^acc) "" lst;

fun frameToState lst = foldr (fn (x, acc) => (map (fn c => c = #"*") (explode x))::acc) [] lst;

fun stateToFrame s = map toString (mapState toChar s);

fun printFrame lst = foldl (fn (x, acc) => print (x^"\n")) () lst;
