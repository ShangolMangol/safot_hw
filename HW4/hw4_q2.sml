use "hw4_q2_def.sml";


local
  fun innerFlatten lst (Br(node, left, Nil)) queue = innerFlatten (lst@[node]) left queue
    | innerFlatten lst (Br(node, left, right)) queue = innerFlatten (lst@[node]) left ([right]@queue)
    | innerFlatten lst Nil (x::xs) = innerFlatten lst x xs
    | innerFlatten lst Nil [] = lst
in
    fun flatten aTree = innerFlatten [] aTree []
end;

flatten (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil)));
flatten (Br(0, Br(1, Br(3,Nil,Nil), Nil), Br(2, Nil, Nil)));



local
  datatype 'a state = notDone of 'a tree | doneLeft of 'a tree | doneBoth of 'a tree

  fun innerMap f (notDone(Br(node, left, right))) queue finished = innerMap f (notDone(left)) ((doneLeft(Br(node, left, right)))::queue) finished
    | innerMap f (doneLeft(Br(node, left, right))) queue finished = innerMap f (notDone(right)) ((doneBoth(Br(node, left, right)))::queue) finished
    | innerMap f (doneBoth(Br(node, left, right))) [] [a1,a2] = (Br(f node, a2, a1))
    | innerMap f (doneBoth(Br(node, left, right))) (x::queue) (a1::(a2::finished)) = innerMap f x queue ((Br(f node, a2, a1))::finished)
    | innerMap f (notDone(Nil)) (x::queue) finished = innerMap f x queue (Nil::finished)


in
  fun map f Nil = Nil
    | map f aTree = innerMap f (notDone(aTree)) [] []
end;

(* map (fn x => 2 * x) (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil))); *)

val test1 = map (fn x => 2 * x) (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil)));
(* Expected: Br(0, Br(2, Nil, Nil), Br(4, Nil, Nil)) *)

val test2 = map (fn x => x + 1) (Br(3, Br(2, Nil, Nil), Br(1, Nil, Nil)));
(* Expected: Br(4, Br(3, Nil, Nil), Br(2, Nil, Nil)) *)

val test3 = map (fn x => x * x) (Br(1, Br(2, Nil, Nil), Br(3, Nil, Nil)));
(* Expected: Br(1, Br(4, Nil, Nil), Br(9, Nil, Nil)) *)

val test4 = map (fn x => x + 10) (Br(5, Br(6, Nil, Nil), Br(7, Nil, Nil)));
(* Expected: Br(15, Br(16, Nil, Nil), Br(17, Nil, Nil)) *)

val test5 = map (fn x => x) (Br("a", Br("b", Nil, Nil), Br("c", Nil, Nil)));
(* Expected: Br("a", Br("b", Nil, Nil), Br("c", Nil, Nil)) *)

val test6 = map (fn x => x ^ "ing") (Br("run", Br("jump", Nil, Nil), Br("walk", Nil, Nil)));
(* Expected: Br("running", Br("jumping", Nil, Nil), Br("walking", Nil, Nil)) *)

val test7 = map (fn x => x - 5) Nil;
(* Expected: Nil *)

fun assertEqual (actual, expected) =
  if expected = actual then
    print "Test passed\n"
  else
    print "Test faileddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\n";


val test1 = (map (fn x => x + 1) (Br(0, Br(1, Nil, Nil), Br(2, Br(3, Nil, Nil), Br(4, Nil, Nil)))),
             Br(1, Br(2, Nil, Nil), Br(3, Br(4, Nil, Nil), Br(5, Nil, Nil))));
assertEqual test1;

val test2 = (map (fn x => x * x) (Br(2, Br(3, Br(4, Nil, Nil), Nil), Br(5, Nil, Nil))),
             Br(4, Br(9, Br(16, Nil, Nil), Nil), Br(25, Nil, Nil)));
assertEqual test2;

val test3 = (map (fn x => (x * x) + (3 * x) + 2) (Br(1, Br(2, Br(3, Nil, Nil), Nil), Br(4, Nil, Nil))),
             Br(6, Br(12, Br(20, Nil, Nil), Nil), Br(30, Nil, Nil)));
assertEqual test3;

val test4 = (map (fn x => if x mod 2 = 0 then "even" else "odd") (Br(1, Br(2, Br(3, Nil, Nil), Nil), Br(4, Nil, Nil))),
             Br("odd", Br("even", Br("odd", Nil, Nil), Nil), Br("even", Nil, Nil)));
assertEqual test4;

val test5 = (map (fn x => (x, x + 1)) (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil))),
             Br((0, 1), Br((1, 2), Nil, Nil), Br((2, 3), Nil, Nil)));
assertEqual test5;

val test6 = (map (fn x => if x > 10 then type1 x else type2 "small") (Br(5, Br(12, Nil, Nil), Br(8, Nil, Nil))),
             Br(type2 "small", Br(type1 12, Nil, Nil), Br(type2 "small", Nil, Nil)));
assertEqual test6;

val test7 = (map (fn x => x ^ " is awesome!") (Br("OpenAI", Br("GPT-3", Nil, Nil), Br("ChatGPT", Nil, Nil))),
             Br("OpenAI is awesome!", Br("GPT-3 is awesome!", Nil, Nil), Br("ChatGPT is awesome!", Nil, Nil)));
assertEqual test7;
