execute as @e[type=armor_stand,tag=demolition_tnt] at @s run function demolition:zzz/game/demolition/tnt/main

execute if score $cooldown demolition_timer matches 1.. run return run function demolition:zzz/game/demolition/cooldown