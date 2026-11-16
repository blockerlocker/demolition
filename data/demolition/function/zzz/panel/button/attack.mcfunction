advancement revoke @s only demolition:interaction_attack

tag @s add demolition_interact_player

execute as @e[predicate=demolition:interaction_attack] run function demolition:zzz/panel/button/validate_attack

tag @s remove demolition_interact_player