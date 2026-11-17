gamerule max_block_modifications 64000
gamerule fall_damage false
gamerule spawn_mobs false
gamerule advance_time false
gamerule advance_weather false
gamerule block_drops false
gamerule mob_drops false
gamerule locator_bar false
gamerule show_advancement_messages false
gamerule random_tick_speed 0

###gamerule send_command_feedback false

team add demolition_team_1
team add demolition_team_2
team modify demolition_team_1 color red
team modify demolition_team_2 color blue

advancement revoke @a only demolition:interaction_attack
advancement revoke @a only demolition:interaction_use

execute unless data storage demolition:settings blast_limit run data merge storage demolition:settings {\
    blast_limit: 400,\
    block_limit: 200,\
    cell_limit: 32\
}

scoreboard objectives add demolition_timer dummy

scoreboard objectives add demolition_p1_stats dummy {text:"Build Stats",color:green,shadow_color:[0,0.3,0,1]}
scoreboard players display name $blast demolition_p1_stats {text:"Blast Resist",color:yellow,shadow_color:[0.15,0.15,0,1]}
scoreboard players display name $blocks demolition_p1_stats {text:"Block Count",color:yellow,shadow_color:[0.15,0.15,0,1]}
scoreboard players display name $cells demolition_p1_stats {text:"Cell Count",color:yellow,shadow_color:[0.15,0.15,0,1]}
scoreboard players set $blast demolition_p1_stats 3
scoreboard players set $blocks demolition_p1_stats 2
scoreboard players set $cells demolition_p1_stats 1

scoreboard objectives add demolition_p2_stats dummy {text:"Build Stats",color:green,shadow_color:[0,0.3,0,1]}
scoreboard players display name $blast demolition_p2_stats {text:"Blast Resist",color:yellow,shadow_color:[0.15,0.15,0,1]}
scoreboard players display name $blocks demolition_p2_stats {text:"Block Count",color:yellow,shadow_color:[0.15,0.15,0,1]}
scoreboard players display name $cells demolition_p2_stats {text:"Cell Count",color:yellow,shadow_color:[0.15,0.15,0,1]}
scoreboard players set $blast demolition_p2_stats 3
scoreboard players set $blocks demolition_p2_stats 2
scoreboard players set $cells demolition_p2_stats 1