execute unless entity @s[type=marker,tag=demolition_p1_arena] run return run execute as @e[type=marker,tag=demolition_p1_arena] at @s run function demolition:zzz/delete/p1_arena

fill ~-2 ~-3 ~ ~31 ~14 ~34 air
fill ~-2 ~-3 ~ ~31 ~-2 ~34 dirt
fill ~-2 ~-1 ~ ~31 ~-1 ~34 grass_block

kill @e[type=text_display,tag=demolition_p1_text]
kill @e[type=marker,tag=demolition_p1_cell]
kill @e[tag=demolition_p1_panel]
kill @e[tag=demolition_p1_hud]

forceload remove ~-2 ~ ~31 ~34

kill @s