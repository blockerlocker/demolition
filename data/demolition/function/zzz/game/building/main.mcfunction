# If arena build plates don't make cache build plates, update build stats.
$execute positioned $(p1_build_plate_x) $(p1_build_plate_y) $(p1_build_plate_z) unless blocks ~ ~ ~ ~20 ~11 ~26 $(p1_cache_x) $(p1_cache_y) $(p1_cache_z) all run function demolition:zzz/game/building/p1_update with storage demolition:data
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) unless blocks ~ ~ ~ ~20 ~11 ~26 $(p2_cache_x) $(p2_cache_y) $(p2_cache_z) all run function demolition:zzz/game/building/p2_update with storage demolition:data

# Fix barrier floor and wall
$execute positioned $(p1_build_plate_x) $(p1_build_plate_y) $(p1_build_plate_z) run fill ~-3 ~-1 ~-3 ~23 ~-1 ~29 barrier strict
$execute positioned $(p1_arena_x) $(p1_arena_y) $(p1_arena_z) run fill ~2 ~ ~ ~2 ~14 ~34 barrier strict
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) run fill ~-3 ~-1 ~-3 ~23 ~-1 ~29 barrier strict
$execute positioned $(p2_arena_x) $(p2_arena_y) $(p2_arena_z) run fill ~-2 ~ ~ ~-2 ~14 ~34 barrier strict