use "hw4_q2_def.sml";


List.rev [1,2,3,4,5,6,7,8,9,10];


local
  fun innerFlatten lst (Br(node, left, Nil)) queue = innerFlatten (lst@[node]) left queue
    | innerFlatten lst (Br(node, left, right)) queue = innerFlatten (lst@[node]) left ([right]@queue)
    | innerFlatten lst Nil (x::xs) = innerFlatten lst x xs
    | innerFlatten lst Nil [] = lst
in
    fun flatten aTree = innerFlatten [] aTree []
end;

flatten (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil)));


(* 
local
  fun innerMap f (Br(node, left, right)) type1(newTree) = innerMap f right type2(innerMap f left type1(Br(f node, newTree, Nil)) )
    | innerMap f (Br(node, left, right)) type2(newTree) = innerMap f right type2(innerMap f left type1(Br(f node, Nil, newTree)) )
    | innerMap f Nil aTree = aTree
in
  fun map f aTree = innerMap f aTree Nil
end;

map (fn x => 2 * x) (Br(0, Br(1, Nil, Nil), Br(2, Nil, Nil)));
  
   *)