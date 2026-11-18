data merge storage demolition:state {current_state:active,game_phase:demolition}

execute at @n[type=marker,tag=demolition_p1_cell,nbt={data:{demolition:{cell:[g,5]}}}] run tp @a[team=demolition_team_1] ~2 ~10 ~ 90 30
execute at @n[type=marker,tag=demolition_p2_cell,nbt={data:{demolition:{cell:[g,5]}}}] run tp @a[team=demolition_team_2] ~-2 ~10 ~ -90 30

gamemode spectator @a[tag=demolition_active_player]
gamemode creative @a[tag=demolition_active_player]

execute as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 2 2
execute as @a at @s run playsound entity.generic.explode master @s ~ ~ ~ 2 1
function demolition:zzz/notif/subtitle {subtitle:'{text:"Demolition!",color:green}'}

execute as @a[tag=demolition_active_player] run attribute @s block_interaction_range modifier add demolition:no_building -2000 add_value
clear @a

scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.blue

function demolition:zzz/reset/panel_icons

data remove storage demolition:demolition all

data merge storage demolition:demolition {all:{cooldown:turn_cycle}}
scoreboard players set $cooldown demolition_timer 40