execute as @e[type=marker,tag=demolition_p2_arena] at @s run function demolition:zzz/delete/p2_arena

execute align xyz run summon marker ~.5 ~ ~.5 {Tags:[demolition_p2_arena]}

place template demolition:default_wall ~-2 ~-3 ~
place template demolition:default_p2_arena ~-31 ~-3 ~

forceload add ~-31 ~ ~2 ~34

execute align xyz summon marker run function blpack:get/marker_pos
execute store result storage demolition:data p2_arena_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data p2_arena_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data p2_arena_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~-27 ~ ~4 summon marker run function blpack:get/marker_pos
execute store result storage demolition:data p2_build_plate_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data p2_build_plate_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data p2_build_plate_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~-2 ~3 ~17.5 rotated 90 0 run function demolition:zzz/panel/create {player:p2}