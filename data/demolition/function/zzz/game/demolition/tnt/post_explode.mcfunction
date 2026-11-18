function demolition:zzz/game/demolition/block_count with storage demolition:data
data modify storage demolition:temp all.p1_lost_blocks set compute default integer {type:sub,left:{type:storage,storage:"demolition:demolition",path:"all.p1_pre_explode"},right:{type:storage,storage:"demolition:demolition",path:"all.p1_blocks"}}
data modify storage demolition:temp all.p2_lost_blocks set compute default integer {type:sub,left:{type:storage,storage:"demolition:demolition",path:"all.p2_pre_explode"},right:{type:storage,storage:"demolition:demolition",path:"all.p2_blocks"}}

execute if data storage demolition:demolition {all:{turn:p1}} run data modify storage demolition:temp all.lost_blocks set from storage demolition:temp all.p2_lost_blocks
execute if data storage demolition:demolition {all:{turn:p2}} run data modify storage demolition:temp all.lost_blocks set from storage demolition:temp all.p1_lost_blocks

execute as @n[type=text_display,tag=demolition_queue_state_change] at @s run function demolition:zzz/game/demolition/panel_icon/update with storage demolition:demolition all

function demolition:zzz/hud/update

execute if data storage demolition:demolition all{p2_blocks:0} run return run function demolition:zzz/game/demolition/win_p1
execute if data storage demolition:demolition all{p1_blocks:0} run return run function demolition:zzz/game/demolition/win_p2

execute unless data storage demolition:temp all{lost_blocks:0} as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 2 1
execute if data storage demolition:temp all{lost_blocks:0} as @a at @s run playsound block.glass.break master @s ~ ~ ~ 1 1

execute unless data storage demolition:temp all{lost_blocks:0} run title @a actionbar [{text:"Destroyed ",color:green},{storage:"demolition:temp",nbt:"all.lost_blocks"}," blocks"]
execute if data storage demolition:temp all{lost_blocks:0} run title @a actionbar [{text:"No blocks destroyed.",color:red}]

data merge storage demolition:demolition {all:{cooldown:turn_cycle}}
scoreboard players set $cooldown demolition_timer 30