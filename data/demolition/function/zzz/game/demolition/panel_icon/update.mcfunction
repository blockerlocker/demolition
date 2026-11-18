tag @s remove demolition_queue_state_change

execute unless data storage demolition:temp all{hit:true} run data merge entity @s {text:{sprite:"notification/more",atlas:gui,color:dark_green},transformation:{scale:[2.5,2.5,0],translation:[-0.0625,-0.375,0]}}
execute if data storage demolition:temp all{hit:true} run data merge entity @s {text:{sprite:"notification/more",atlas:gui,color:white},transformation:{scale:[2.5,2.5,0],translation:[-0.0625,-0.375,0]}}

data modify storage demolition:temp all.total_destroyed set value 0
data modify storage demolition:temp all.total_destroyed set from entity @s data.demolition.total_destroyed

data modify storage demolition:temp all.total_destroyed set compute default integer {type:add,inputs:[{type:storage,storage:"demolition:temp",path:"all.total_destroyed"},{type:storage,storage:"demolition:temp",path:"all.lost_blocks"}]}
data modify entity @s data.demolition.total_destroyed set from storage demolition:temp all.total_destroyed

execute if data storage demolition:temp all{total_destroyed:0} run return fail

$execute summon text_display run data merge entity @s {Tags:[demolition_icon_count,demolition_panel,demolition_$(turn)_panel],text:{storage:"demolition:temp",nbt:"all.total_destroyed",plain:true},shadow:true,background:0,transformation:{translation:[-0.01625,-0.125,0.01]}}
rotate @n[tag=demolition_icon_count] ~ ~