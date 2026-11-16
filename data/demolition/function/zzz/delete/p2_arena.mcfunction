execute unless entity @s[type=marker,tag=demolition_p2_arena] run return run execute as @e[type=marker,tag=demolition_p2_arena] at @s run function demolition:zzz/delete/p2_arena

fill ~-31 ~-3 ~ ~2 ~14 ~34 air
fill ~-31 ~-3 ~ ~2 ~-2 ~34 dirt
fill ~-31 ~-1 ~ ~2 ~-1 ~34 grass_block

kill @e[type=text_display,tag=demolition_p2_text]
kill @e[type=marker,tag=demolition_p2_cell]
kill @e[tag=demolition_p2_panel]

forceload remove ~-31 ~ ~2 ~34

kill @s