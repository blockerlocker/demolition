execute unless entity @s[type=marker,tag=demolition_lobby] run return run execute as @e[type=marker,tag=demolition_lobby] at @s run function demolition:zzz/delete/lobby

fill ~-31 ~-3 ~ ~31 ~14 ~34 air
fill ~-31 ~-3 ~ ~31 ~-2 ~34 dirt
fill ~-31 ~-1 ~ ~31 ~-1 ~34 grass_block

kill @e[tag=demolition_lobby_text]
kill @e[tag=demolition_lobby_panel]
kill @e[tag=demolition_lobby_hud]

forceload remove ~-31 ~ ~31 ~34

kill @s