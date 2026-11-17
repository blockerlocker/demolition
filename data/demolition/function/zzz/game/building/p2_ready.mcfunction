execute if data storage demolition:building all{p2_blocks:0} run return run function demolition:zzz/notif/actionbar_red {text:"Your build has no blocks!"}
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) if predicate demolition:build/has_unblastable_block run return run function demolition:zzz/notif/actionbar_red {text:"You cannot have un-blastable blocks in your build!"}
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) if predicate demolition:build/has_waterlogged_block run return run function demolition:zzz/notif/actionbar_red {text:"You cannot have waterlogged blocks in your build!"}
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) if predicate {type:any_of,terms:["demolition:build/p2_exceed_blast","demolition:build/p2_exceed_blocks","demolition:build/p2_exceed_cells"]} run return run function demolition:zzz/notif/actionbar_red {text:"Remove blocks to bring down your Build Stats."}

execute if data storage demolition:building {all:{p2_ready:true}} run return run function demolition:zzz/game/building/p2_unready

execute unless data storage demolition:building {all:{p1_ready:true}} as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 2 1
tellraw @a [{player:blockerlocker},{text:" > ",color:yellow},{text:"Team 2",color:blue},{text:" is ready!",color:yellow}]

data merge storage demolition:building {all:{p2_ready:true}}

execute if data storage demolition:building {all:{p1_ready:true,p2_ready:true}} run function demolition:zzz/game/demolition/begin