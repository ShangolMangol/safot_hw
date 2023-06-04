use "hw4_q3_def.sml";

(* datatype 'a biseq = Nil | BiCons of  'a seq * (unit -> 'a biseq); *)


type 'a biseq = 'a seq * 'a seq list;
exception SeqErr;

* 1 2 3 *

(* fun new Cons(k, f) = BiCons(Cons(k,f), fn () => new Cons(k-1,f)); *)

fun new (Cons(k,f)) = (Cons(k,f), [Cons(k,f)])
   | new Nil = raise SeqErr;

fun curr (Nil, lst) = raise SeqErr
  | curr ((Cons(k,f)), lst) = k;

fun empty ((Cons(k,f)), lst) = case f() of
   Nil => true
 | _ => false;

let
  fun listFind k (Cons(m,g))::xs = if k = m then 

in
  body
end

fun next ((Cons(k,f)), lst) = if listFind 


