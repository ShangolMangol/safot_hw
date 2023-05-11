use "hw3_q2_def.sml";

(* 1 *)

functor Kernel1D (Elt: KERNEL1D_SIG) = struct
    local
      fun innerFunc x (a::[]) = (Elt.kernel x a (Elt.default(a)))::[]
        | innerFunc x (a::b::lst) = (Elt.kernel x a b)::(innerFunc a (b::lst))
        | innerFunc x _ = [];
    in
      fun runKernel [] = []
        | runKernel lst = innerFunc (Elt.default(hd lst)) lst;
    end
end;

fun sum leftNeighbor value rightNeighbor = leftNeighbor + value + rightNeighbor;


structure SumKernel = Kernel1D(struct
	type source = int
	type target = int
	val kernel = sum
	fun default _ = 0
end);
SumKernel.runKernel [1, 2, 3, 4];



(* 2a *)

exception SizeNotEqual;

fun zip (a::[]) (b::[]) (c::[]) = (a,b,c)::[]
  | zip (a::af) (b::bf) (c::cf) = (a,b,c)::(zip af bf cf) 
  | zip _ _ _ = raise SizeNotEqual;

zip [1, 2, 3] [4, 5, 6] [7, 8, 9];


(* 2b *)

exception NegativeLength;

fun fill a 0 = []
  | fill a n = if (n < 0) then raise NegativeLength
               else a::(fill a (n-1));
        
fill false 3;


(* 3 *)

functor Kernel2D (Elt : KERNEL2D_SIG) =
struct
  local
    structure tempKernel = Kernel1D(struct
	type source = Elt.source list
	type target = Elt.target list
	fun kernel a b c = Elt.kernel (hd (zip a b c))
	fun default _::x::_ = Elt.default x
    end);
    tempKernel.runKernel 
  in
    fun runKernel lst = Elt.kernel zip lst
  end
end;

