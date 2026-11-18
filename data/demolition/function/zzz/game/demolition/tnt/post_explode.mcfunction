function demolition:zzz/game/demolition/block_count with storage demolition:data
data modify storage demolition:temp all.p1_lost_blocks set compute default integer {type:sub,left:{type:storage,storage:"demolition:demolition",path:"all.p1_pre_explode"},right:{type:storage,storage:"demolition:demolition",path:"all.p1_blocks"}}
data modify storage demolition:temp all.p2_lost_blocks set compute default integer {type:sub,left:{type:storage,storage:"demolition:demolition",path:"all.p2_pre_explode"},right:{type:storage,storage:"demolition:demolition",path:"all.p2_blocks"}}

execute if data storage demolition:demolition {all:{turn:p1}} run data modify storage demolition:temp all.lost_blocks set from storage demolition:temp all.p2_lost_blocks
execute if data storage demolition:demolition {all:{turn:p2}} run data modify storage demolition:temp all.lost_blocks set from storage demolition:temp all.p1_lost_blocks

execute unless data storage demolition:temp all{lost_blocks:0} run data merge storage demolition:temp {all:{hit:true}}
execute unless data storage demolition:temp all{lost_blocks:0} run data merge storage demolition:temp {all:{hit:true}}

execute as @n[type=text_display,tag=demolition_queue_state_change] at @s run function demolition:zzz/game/demolition/panel_icon/update with storage demolition:demolition all

execute if data storage demolition:demolition all{p2_blocks:0} run return run function demolition:zzz/game/demolition/win_p1
execute if data storage demolition:demolition all{p1_blocks:0} run return run function demolition:zzz/game/demolition/win_p2

execute as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 2 1

execute store result storage demolition:temp all.team_1_count int 1 if entity @a[team=demolition_team_1]
execute store result storage demolition:temp all.team_2_count int 1 if entity @a[team=demolition_team_2]

function demolition:zzz/hud/update

data modify storage demolition:temp all.team_1_name set value {text:"Team 1",color:red}
execute if data storage demolition:temp all{team_1_count:1} run data modify storage demolition:temp all.team_1_name set value {selector:"@p[team=demolition_team_1]",color:red}
data modify storage demolition:temp all.team_2_name set value {text:"Team 2",color:blue}
execute if data storage demolition:temp all{team_2_count:1} run data modify storage demolition:temp all.team_2_name set value {selector:"@p[team=demolition_team_2]",color:blue}

title @a actionbar [{text:"Destroyed ",color:green},{storage:"demolition:temp",nbt:"all.lost_blocks"}," blocks"]

data merge storage demolition:demolition {all:{cooldown:turn_cycle}}
scoreboard players set $cooldown demolition_timer 30