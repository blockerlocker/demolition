execute if score $cooldown demolition_timer matches 1.. run return fail

execute on target if data storage demolition:demolition all{turn:p1} if entity @s[team=demolition_team_2] run return run playsound block.note_block.bass master @a
execute on target if data storage demolition:demolition all{turn:p2} if entity @s[team=demolition_team_1] run return run playsound block.note_block.bass master @a

playsound ui.button.click master @a
execute as @a at @s run playsound entity.tnt.primed master @s ~ ~ ~ 2 1

data modify storage demolition:temp all.target_cell set from entity @s data.demolition.button

execute if data storage demolition:temp all{target_cell:[a]} run data modify storage demolition:temp all.imitation_cell set value [g]
execute if data storage demolition:temp all{target_cell:[b]} run data modify storage demolition:temp all.imitation_cell set value [f]
execute if data storage demolition:temp all{target_cell:[c]} run data modify storage demolition:temp all.imitation_cell set value [e]
execute if data storage demolition:temp all{target_cell:[d]} run data modify storage demolition:temp all.imitation_cell set value [d]
execute if data storage demolition:temp all{target_cell:[e]} run data modify storage demolition:temp all.imitation_cell set value [c]
execute if data storage demolition:temp all{target_cell:[f]} run data modify storage demolition:temp all.imitation_cell set value [b]
execute if data storage demolition:temp all{target_cell:[g]} run data modify storage demolition:temp all.imitation_cell set value [a]

execute if data storage demolition:temp all{target_cell:[1]} run data modify storage demolition:temp all.imitation_cell append value 9
execute if data storage demolition:temp all{target_cell:[2]} run data modify storage demolition:temp all.imitation_cell append value 8
execute if data storage demolition:temp all{target_cell:[3]} run data modify storage demolition:temp all.imitation_cell append value 7
execute if data storage demolition:temp all{target_cell:[4]} run data modify storage demolition:temp all.imitation_cell append value 6
execute if data storage demolition:temp all{target_cell:[5]} run data modify storage demolition:temp all.imitation_cell append value 5
execute if data storage demolition:temp all{target_cell:[6]} run data modify storage demolition:temp all.imitation_cell append value 4
execute if data storage demolition:temp all{target_cell:[7]} run data modify storage demolition:temp all.imitation_cell append value 3
execute if data storage demolition:temp all{target_cell:[8]} run data modify storage demolition:temp all.imitation_cell append value 2
execute if data storage demolition:temp all{target_cell:[9]} run data modify storage demolition:temp all.imitation_cell append value 1

execute if data storage demolition:demolition all{turn:p1} run data modify storage demolition:temp all.sender set value p1
execute if data storage demolition:demolition all{turn:p1} run data modify storage demolition:temp all.receiver set value p2

execute if data storage demolition:demolition all{turn:p2} run data modify storage demolition:temp all.sender set value p2
execute if data storage demolition:demolition all{turn:p2} run data modify storage demolition:temp all.receiver set value p1

execute at @s positioned ~ ~.5 ~ as @n[type=text_display,tag=demolition_icon] at @s run function demolition:zzz/game/demolition/panel_icon/queue_state_change

function demolition:zzz/game/demolition/tnt/spawn with storage demolition:temp all

data merge storage demolition:demolition {all:{cooldown:post_explode}}
scoreboard players set $cooldown demolition_timer 60