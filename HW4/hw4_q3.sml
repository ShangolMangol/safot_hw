use "hw4_q3_def.sml";

(* datatype 'a biseq = Nil | BiCons of  'a seq * (unit -> 'a biseq); *)


type 'a biseq = int * 'a seq * (int * 'a seq) list;
exception SeqErr;

(* * 1 2 3 * *)

(* fun new Cons(k, f) = BiCons(Cons(k,f), fn () => new Cons(k-1,f)); *)

fun new (Cons(k,f)) = (0, Cons(k,f), [(0, Cons(k,f))])
   | new Nil = (~2, Nil, []);

fun curr (i, Nil, lst) = raise SeqErr
  | curr (i, (Cons(k,f)), lst) = k;

fun empty (i, (Cons(k,f)), lst) = false
  | empty (i, Nil, lst) = true;


local
  fun listFind i [] = (~1, Nil)
    | listFind i ((j, x)::xs) = if i = j then (j, x) else listFind i xs

in
  fun next (~2, Nil, lst) = raise SeqErr
    | next (~1, Nil, lst) = 
      let
        val (resultCode, nextNode) = listFind 0 lst
      in
        (0, nextNode, lst)
      end
    | next (i, Nil, lst) = raise SeqErr
    | next (i, (Cons(k,f)), lst) = 
    let
      val (resultCode, nextNode) = listFind (i+1) lst
    in
      if (resultCode = ~1) then 
        let
          val newNode = f()
        in
          ((i+1), newNode, (((i+1), newNode)::lst))
        end
      else ((i+1), nextNode, lst)
    end


  fun prev (~2, Nil, lst) = raise SeqErr
    | prev (~1, Nil, lst) = raise SeqErr
    | prev (0, Cons(k,f), lst) = (~1, Nil, lst)
    | prev (i, _, lst) = 
        let
          val (resultCode, prevNode) = listFind (i-1) lst
        in
          ((i-1), prevNode, lst)
        end
end
