execute as @a at @s run playsound ui.button.click master @a ~ ~ ~ 0.5 2

execute unless data storage demolition:demolition all{turn:p1} run return run function demolition:zzz/game/demolition/turn_p1
execute unless data storage demolition:demolition all{turn:p2} run return run function demolition:zzz/game/demolition/turn_p2