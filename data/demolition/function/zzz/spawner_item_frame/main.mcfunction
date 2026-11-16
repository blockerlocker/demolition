playsound block.vault.place master @a ~ ~ ~ 5

execute if data entity @s data.demolition{summon:"lobby"} run function demolition:zzz/spawner_item_frame/lobby
execute if data entity @s data.demolition{summon:"p1"} run function demolition:zzz/spawner_item_frame/p1_arena
execute if data entity @s data.demolition{summon:"p2"} run function demolition:zzz/spawner_item_frame/p2_arena
execute if data entity @s data.demolition{summon:"joint_arena"} run function demolition:zzz/spawner_item_frame/joint_arena