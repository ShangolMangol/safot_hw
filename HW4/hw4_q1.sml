use "hw4_q1_def.sml";

local
  structure cycleKernel = Kernel2D(struct
      type source = bool
      type target = bool
      val kernel = is_alive_bool
      fun default x = false
    end);
in
    fun runCycle initFrame = stateToFrame (cycleKernel.runKernel (frameToState initFrame));
end;

runCycle [" *** ", " * * ", " *** "];

fun gameOfLife initFrame = 
    let
      val curFrame = ref initFrame;
    in
      fn () => (printFrame (!curFrame) ; curFrame := runCycle (!curFrame))
    end
    
val game = gameOfLife [" *** ", " * * ", " *** "];
game();
game();
game();

run (gameOfLife start_frame) 100 0.5;



