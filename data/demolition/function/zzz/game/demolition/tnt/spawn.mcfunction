function demolition:zzz/game/demolition/block_count with storage demolition:data
data modify storage demolition:demolition all.p1_pre_explode set from storage demolition:temp all.p1_blocks
data modify storage demolition:demolition all.p2_pre_explode set from storage demolition:temp all.p2_blocks

$execute at @n[type=marker,tag=demolition_$(receiver)_cell,nbt={data:{demolition:{cell:$(target_cell)}}}] positioned ~ ~45 ~ run function demolition:zzz/game/demolition/tnt/real

$execute if data storage demolition:demolition all{turn:p1} at @n[type=marker,tag=demolition_p1_cell,nbt={data:{demolition:{cell:$(imitation_cell)}}}] positioned ~-34 ~45 ~ run function demolition:zzz/game/demolition/tnt/fake
$execute if data storage demolition:demolition all{turn:p2} at @n[type=marker,tag=demolition_p2_cell,nbt={data:{demolition:{cell:$(imitation_cell)}}}] positioned ~34 ~45 ~ run function demolition:zzz/game/demolition/tnt/fake