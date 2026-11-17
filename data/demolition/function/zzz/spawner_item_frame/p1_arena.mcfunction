execute as @e[type=marker,tag=demolition_p1_arena] at @s run function demolition:zzz/delete/p1_arena

execute align xyz run summon marker ~.5 ~ ~.5 {Tags:[demolition_p1_arena]}

place template demolition:default_wall ~-2 ~-3 ~
place template demolition:default_p1_arena ~3 ~-3 ~

forceload add ~-2 ~ ~31 ~34

execute align xyz summon marker run function blpack:get/marker_pos
execute store result storage demolition:data p1_arena_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data p1_arena_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data p1_arena_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~7 ~ ~4 summon marker run function blpack:get/marker_pos
execute store result storage demolition:data p1_build_plate_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data p1_build_plate_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data p1_build_plate_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~3 ~3 ~17.5 rotated -90 0 run function demolition:zzz/panel/create {player:p1}

execute align xyz positioned ~3 ~6 ~27 rotated -90 0 summon text_display run function demolition:zzz/hud/p1_team_id
execute align xyz positioned ~3 ~5.5 ~7.5 rotated -90 0 summon text_display run function demolition:zzz/hud/block_count {player:p1}