execute if data storage demolition:state {current_state:setup} run function demolition:zzz/tick/setup
execute if data storage demolition:state {current_state:lobby} run function demolition:zzz/tick/lobby
execute if data storage demolition:state {current_state:active} run function demolition:zzz/tick/active

kill @e[type=glow_item_frame,predicate=demolition:spawner_item_frame]
data remove storage demolition:temp all
execute as @e[type=#demolition:disallowed] run data merge entity @s {Health:0,DeathTime:20}
kill @e[type=#demolition:disallowed]