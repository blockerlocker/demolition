function demolition:zzz/game/demolition/block_count with storage demolition:data
data modify storage demolition:temp all.p1_lost_blocks set compute default integer {type:sub,left:{type:storage,storage:"demolition:demolition",path:"all.p1_pre_explode"},right:{type:storage,storage:"demolition:demolition",path:"all.p1_blocks"}}
data modify storage demolition:temp all.p2_lost_blocks set compute default integer {type:sub,left:{type:storage,storage:"demolition:demolition",path:"all.p2_pre_explode"},right:{type:storage,storage:"demolition:demolition",path:"all.p2_blocks"}}

execute if data storage demolition:demolition {all:{turn:p1}} unless data storage demolition:temp all{p2_lost_blocks:0} run data merge storage demolition:temp {all:{hit:true}}
execute if data storage demolition:demolition {all:{turn:p2}} unless data storage demolition:temp all{p1_lost_blocks:0} run data merge storage demolition:temp {all:{hit:true}}

execute if data storage demolition:temp all{hit:true} run data merge entity @n[type=text_display,tag=demolition_queue_state_change] {text:{sprite:"notification/more",atlas:gui,color:white},transformation:{scale:[2.5,2.5,0],translation:[-0.0625,-0.375,0]}}
execute unless data storage demolition:temp all{hit:true} run data merge entity @n[type=text_display,tag=demolition_queue_state_change] {text:{sprite:"hud/locator_bar_dot/default_0",atlas:gui,color:dark_gray},transformation:{scale:[2.8125,2.8125,0],translation:[-0.0703125,-0.421875,0]}}
tag @e[type=text_display,tag=demolition_queue_state_change] remove demolition_queue_state_change

execute if data storage demolition:demolition all{p2_blocks:0} run return run function demolition:zzz/game/demolition/win_p1
execute if data storage demolition:demolition all{p1_blocks:0} run return run function demolition:zzz/game/demolition/win_p2

execute as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 2 1

execute store result storage demolition:temp all.team_1_count int 1 if entity @a[team=demolition_team_1]
execute store result storage demolition:temp all.team_2_count int 1 if entity @a[team=demolition_team_2]

function demolition:zzz/hud/update

execute if data storage demolition:demolition {all:{turn:p1}} if data storage demolition:temp all{team_2_count:1} run tellraw @a [{text:"",color:yellow},{selector:"@p[team=demolition_team_2]",color:blue}," lost ",{storage:"demolition:temp",nbt:"all.p2_lost_blocks"}," blocks."]
execute if data storage demolition:demolition {all:{turn:p1}} unless data storage demolition:temp all{team_2_count:1} run tellraw @a [{text:"",color:yellow},{text:"Team 2",color:blue}," lost ",{storage:"demolition:temp",nbt:"all.p2_lost_blocks"}," blocks."]
execute if data storage demolition:demolition {all:{turn:p2}} if data storage demolition:temp all{team_1_count:1} run tellraw @a [{text:"",color:yellow},{selector:"@p[team=demolition_team_1]",color:red}," lost ",{storage:"demolition:temp",nbt:"all.p1_lost_blocks"}," blocks."]
execute if data storage demolition:demolition {all:{turn:p2}} unless data storage demolition:temp all{team_1_count:1} run tellraw @a [{text:"",color:yellow},{text:"Team 1",color:red}," lost ",{storage:"demolition:temp",nbt:"all.p1_lost_blocks"}," blocks."]

data merge storage demolition:demolition {all:{cooldown:turn_cycle}}
scoreboard players set $cooldown demolition_timer 30