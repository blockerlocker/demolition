scoreboard players remove $cooldown demolition_timer 1

execute if score $cooldown demolition_timer matches 1.. run return fail

execute if data storage demolition:demolition all{cooldown:turn_cycle} run function demolition:zzz/game/demolition/turn_cycle
execute if data storage demolition:demolition {all:{cooldown:post_explode}} run function demolition:zzz/game/demolition/tnt/post_explode