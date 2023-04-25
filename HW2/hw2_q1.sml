fun sig1 a b c = if true then c(a,b) else b;
fun sig2 (a,b) c = if a = 5 then true else if c(b/6.9) = "a" then false else true;
fun sig3 f a b d = f a b;
fun sig4 a b c d = c div d;
fun sig5 f a g = g(f a, f a);
fun sig6 () () = 5;
fun sig7 a (b,c) = if true then a else if true then b else c;
fun sig8 (a,b,c) = if a = 5 andalso b = "b" andalso c = "c" then (a,b,c) else (a,c,b);