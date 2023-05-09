use "hw3_q2_def.sml";

functor Kernel1D (Elt: KERNEL1D_SIG) = struct
    local
      fun innerFunc x (a::[]) = (Elt.kernel x a (Elt.default(a)))::[]
        | innerFunc x (a::b::lst) = (Elt.kernel x a b)::(innerFunc a (b::lst));
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
