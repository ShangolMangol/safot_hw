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

