execute as @a run attribute @s block_interaction_range modifier remove demolition:no_building
team leave @a
tag @a[tag=demolition_team_1] remove demolition_team_1
tag @a[tag=demolition_team_2] remove demolition_team_2
tag @a remove demolition_active_player