advancement revoke @s only demolition:interaction_use

tag @s add demolition_interact_player

execute as @e[predicate=demolition:interaction_use] run function demolition:zzz/panel/button/validate_use

tag @s remove demolition_interact_player