scoreboard players add @s demolition_timer 1

execute as @s[scores={demolition_timer=4}] on passengers run data merge entity @s {transformation:{scale:[3,3,3]},start_interpolation:0}

execute if predicate {type:entity_properties,entity:this,predicate:{periodic_tick:10}} store success entity @s data.demolition.blink byte 1 unless data entity @s data.demolition{blink:1b}

execute if data entity @s data.demolition{blink:1b} on passengers run item replace entity @s[tag=demolition_tnt_display] contents with tnt
execute if data entity @s data.demolition{blink:0b} on passengers run item replace entity @s[tag=demolition_tnt_display] contents with white_concrete

execute if predicate {type:entity_properties,entity:this,predicate:{flags:{is_on_ground:false}}} run return fail

execute if entity @s[tag=demolition_real_tnt] run summon tnt ~ ~ ~ {fuse:0}
execute unless entity @s[tag=demolition_real_tnt] run playsound entity.generic.explode master @a ~ ~ ~ 5 0.8

kill @s

execute as @e[type=item_display,tag=demolition_tnt_display] unless predicate {type:entity_properties,entity:this,predicate:{vehicle:{}}} run kill @s