execute as @e[type=marker,tag=demolition_lobby] at @s run function demolition:zzz/delete/lobby

execute align xyz run summon marker ~.5 ~ ~.5 {Tags:[demolition_lobby]}

place template demolition:default_wall ~-2 ~-3 ~
place template demolition:default_p2_arena ~-31 ~-3 ~
place template demolition:default_p1_arena ~3 ~-3 ~

execute positioned ~-31 ~-3 ~ run kill @e[type=marker,tag=demolition_cell,dx=63,dy=14,dz=34]
execute positioned ~-31 ~-3 ~ run tag @e[type=text_display,tag=demolition_p1_text,dx=63,dy=14,dz=34] add demolition_lobby_text
execute positioned ~-31 ~-3 ~ run tag @e[type=text_display,tag=demolition_p1_text,dx=63,dy=14,dz=34] remove demolition_p1_text
execute positioned ~-31 ~-3 ~ run tag @e[type=text_display,tag=demolition_p2_text,dx=63,dy=14,dz=34] add demolition_lobby_text
execute positioned ~-31 ~-3 ~ run tag @e[type=text_display,tag=demolition_p2_text,dx=63,dy=14,dz=34] remove demolition_p2_text

forceload add ~-31 ~ ~31 ~34

execute align xyz summon marker run function blpack:get/marker_pos
execute store result storage demolition:data lobby_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data lobby_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data lobby_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~7 ~ ~4 summon marker run function blpack:get/marker_pos
execute store result storage demolition:data p1_cache_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data p1_cache_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data p1_cache_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~-27 ~ ~4 summon marker run function blpack:get/marker_pos
execute store result storage demolition:data p2_cache_x int 1 run data get storage blpack:get all.pos[0]
execute store result storage demolition:data p2_cache_y int 1 run data get storage blpack:get all.pos[1]
execute store result storage demolition:data p2_cache_z int 1 run data get storage blpack:get all.pos[2]

execute align xyz positioned ~3 ~3 ~17.5 rotated -90 0 run function demolition:zzz/panel/create {player:lobby}
execute align xyz positioned ~-2 ~3 ~17.5 rotated 90 0 run function demolition:zzz/panel/create {player:lobby}

kill @e[type=interaction,tag=demolition_lobby_panel]