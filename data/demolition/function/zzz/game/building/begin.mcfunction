data merge storage demolition:state {current_state:active,game_phase:building}

execute at @n[type=marker,tag=demolition_p1_cell,nbt={data:{demolition:{cell:[g,5]}}}] run tp @a[team=demolition_team_1] ~ ~10 ~ 90 60
execute at @n[type=marker,tag=demolition_p2_cell,nbt={data:{demolition:{cell:[g,5]}}}] run tp @a[team=demolition_team_2] ~ ~10 ~ -90 60

execute as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 2 2

tellraw @a ["\n",{player:blockerlocker},{text:" > Time to get building!\n\n",color:yellow},{text:"When both players are ready, interact with the Panel on the wall to begin Demolition!",color:green}]

tag @a remove demolition_active_player
tag @a[team=demolition_team_1] add demolition_active_player
tag @a[team=demolition_team_2] add demolition_active_player

scoreboard objectives setdisplay sidebar.team.red demolition_p1_stats
scoreboard objectives setdisplay sidebar.team.blue demolition_p2_stats

gamemode spectator @a[tag=demolition_active_player]
gamemode creative @a[tag=demolition_active_player]

effect clear @a

function demolition:zzz/reset/panel_icons
function demolition:zzz/reset/hud_block_count

data remove storage demolition:building all
data merge storage demolition:building {all:{p1_blast:0.0f,p1_blocks:0,p1_cells:0,p2_blast:0.0f,p2_blocks:0,p2_cells:0}}

execute store result storage demolition:temp all.blast_limit_display float 1 run data get storage demolition:settings blast_limit
data modify storage demolition:temp all.blast_limit_display set string storage demolition:temp all.blast_limit_display 0 -1

scoreboard players display numberformat $blast demolition_p1_stats fixed [{text:"0.0",color:aqua,shadow_color:[0,0.15,0.15,1]},"/",{storage:"demolition:temp",nbt:"all.blast_limit_display",interpret:true}]
scoreboard players display numberformat $blocks demolition_p1_stats fixed [{text:"0",color:aqua,shadow_color:[0,0.15,0.15,1]},"/",{storage:"demolition:settings",nbt:"block_limit",plain:true}]
scoreboard players display numberformat $cells demolition_p1_stats fixed [{text:"0",color:aqua,shadow_color:[0,0.15,0.15,1]},"/",{storage:"demolition:settings",nbt:"cell_limit",plain:true}]

scoreboard players display numberformat $blast demolition_p2_stats fixed [{text:"0.0",color:aqua,shadow_color:[0,0.15,0.15,1]},"/",{storage:"demolition:temp",nbt:"all.blast_limit_display",interpret:true}]
scoreboard players display numberformat $blocks demolition_p2_stats fixed [{text:"0",color:aqua,shadow_color:[0,0.15,0.15,1]},"/",{storage:"demolition:settings",nbt:"block_limit",plain:true}]
scoreboard players display numberformat $cells demolition_p2_stats fixed [{text:"0",color:aqua,shadow_color:[0,0.15,0.15,1]},"/",{storage:"demolition:settings",nbt:"cell_limit",plain:true}]

function demolition:zzz/game/building/restore_moving_piston with storage demolition:data

execute as @a run attribute @s block_interaction_range modifier remove demolition:no_building