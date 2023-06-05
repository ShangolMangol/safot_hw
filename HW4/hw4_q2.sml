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
  fun innerMap f Br(node, left, right) (type1(aTree))::queue finished  = innerMap f right (type2(aTree))::queue finished
    | innerMap f Br(node, left, right) (type2(aTree))::(type1(nextNode))::queue a1::a2::finished = innerMap f nextNode queue (Br(f node, a2, a1))::finished
    | innerMap f Br(node, Nil, Nil) (type1(aTree))::queue finished = innerMap f aTree (type2(aTree))::queue (Br(f node, Nil, Nil))::finished
in
  fun map f aTree = innerMap f aTree [] []
end;

(* local
  fun innerMap f (Br(node, left, right)) type1(newTree) = innerMap f right type2(innerMap f left type1(Br(f node, newTree, Nil)) )
    | innerMap f (Br(node, left, right)) type2(newTree) = innerMap f right type2(innerMap f left type1(Br(f node, Nil, newTree)) )
    | innerMap f Nil aTree = aTree
in
  fun map f aTree = innerMap f aTree Nil
end; *)

map (fn x => 2 * x) (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil)));
