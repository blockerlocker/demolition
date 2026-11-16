execute if data storage demolition:building all{p1_blocks:0} run return run function demolition:zzz/notif/actionbar_red {text:"Your build has no blocks!"}
$execute positioned $(p1_build_plate_x) $(p1_build_plate_y) $(p1_build_plate_z) if predicate demolition:build/has_unblastable_block run return run function demolition:zzz/notif/actionbar_red {text:"You cannot have un-blastable blocks in your build!"}
$execute positioned $(p1_build_plate_x) $(p1_build_plate_y) $(p1_build_plate_z) if predicate {type:any_of,terms:["demolition:build/p1_exceed_blast","demolition:build/p1_exceed_blocks","demolition:build/p1_exceed_cells"]} run return run function demolition:zzz/notif/actionbar_red {text:"Remove blocks to bring down your Build Stats."}

execute if data storage demolition:building {all:{p1_ready:true}} run return run function demolition:zzz/game/building/p1_unready

execute unless data storage demolition:building {all:{p2_ready:true}} as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 2 1
tellraw @a [{player:blockerlocker},{text:" > ",color:yellow},{text:"Team 1",color:red},{text:" is ready!",color:yellow}]

data merge storage demolition:building {all:{p1_ready:true}}

execute if data storage demolition:building {all:{p1_ready:true,p2_ready:true}} run function demolition:zzz/game/demolition/begin