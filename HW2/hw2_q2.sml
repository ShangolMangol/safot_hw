fun curry f a = fn b => f (a,b);
fun uncurry f (a,b) = f a b;