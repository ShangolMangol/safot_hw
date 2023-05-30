datatype cell = alive | empty;
local
  fun count_alive (alive, alive, alive) = 3
    | count_alive (alive, alive, empty) = 2
    | count_alive (alive, empty, alive) = 2
    | count_alive (empty, alive, alive) = 2
    | count_alive (alive, empty, empty) = 1
    | count_alive (empty, alive, empty) = 1
    | count_alive (empty, empty, alive) = 1
    | count_alive (empty, empty, empty) = 0
in
  fun is_alive (c1,c2,c3) (c4,c5,c6) (c7,c8,c9) = let 
    val alive_neighbors = count_alive (c1,c2,c3) + count_alive (c4,empty,c6) + count_alive (c7,c8,c9)
    in
      if alive_neighbors = 3 then alive
      else if alive_neighbors = 2 then c5
      else empty
    end
end;





