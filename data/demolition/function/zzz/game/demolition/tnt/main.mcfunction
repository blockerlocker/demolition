scoreboard players add @s demolition_timer 1

execute as @s[scores={demolition_timer=4}] on passengers run data merge entity @s {transformation:{scale:[3,3,3]},start_interpolation:0}

execute if predicate {type:entity_properties,entity:this,predicate:{flags:{is_on_ground:false}}} run return fail

execute if entity @s[tag=demolition_real_tnt] run summon tnt ~ ~ ~ {fuse:0}
execute unless entity @s[tag=demolition_real_tnt] run playsound entity.generic.explode master @a ~ ~ ~ 5 0.8

scoreboard players set $cooldown demolition_timer 3

execute as @e[type=armor_stand,tag=demolition_tnt,tag=!demolition_real_tnt] at @s run function demolition:zzz/game/demolition/tnt/fake_explode

function demolition:zzz/game/demolition/tnt/delete