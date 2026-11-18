# Unready team if they change their build.
execute if data storage demolition:building {all:{p2_ready:true}} run function demolition:zzz/game/building/p2_unready

# Warn players if they have an illegal block in their build
execute if predicate demolition:build/has_unblastable_block as @a[team=demolition_team_2] at @s run function demolition:zzz/notif/actionbar_red {text:"You cannot have un-blastable blocks in your build!"}
execute if predicate demolition:build/has_waterlogged_block as @a[team=demolition_team_2] at @s run function demolition:zzz/notif/actionbar_red {text:"You cannot have waterlogged blocks in your build!"}

# Remove illegal blocks
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) run fill ~ ~ ~ ~20 ~11 ~26 air replace #demolition:unblastable strict

# Get build stats
data modify storage demolition:building all.p2_blast set compute default float demolition:total_blast_resistance
data modify storage demolition:building all.p2_blocks set compute default integer demolition:block_count
data modify storage demolition:building all.p2_cells set value 0
execute at @e[type=marker,tag=demolition_p2_cell] positioned ~-1 ~ ~-1 if predicate demolition:cell_has_contents run data modify storage demolition:building all.p2_cells set compute default integer {type:add,inputs:[{type:storage,storage:"demolition:building",path:all.p2_cells},1]}

# Format blast resistance for display
data modify storage demolition:temp all.p2_blast_display set compute default float {type:div,left:{type:round,input:{type:mul,inputs:[{type:storage,storage:"demolition:building",path:"all.p2_blast"},10]}},right:10}
data modify storage demolition:temp all.p2_blast_display set string storage demolition:temp all.p2_blast_display 0 -1
execute store result storage demolition:temp all.blast_limit_display float 1 run data get storage demolition:settings blast_limit
data modify storage demolition:temp all.blast_limit_display set string storage demolition:temp all.blast_limit_display 0 -1

# Set scoreboard displays
scoreboard players display numberformat $blast demolition_p2_stats fixed [{storage:"demolition:temp",nbt:"all.p2_blast_display",color:aqua,shadow_color:[0,0.15,0.15,1],interpret:true},"/",{storage:"demolition:temp",nbt:"all.blast_limit_display",interpret:true}]
scoreboard players display numberformat $blocks demolition_p2_stats fixed [{storage:"demolition:building",nbt:"all.p2_blocks",color:aqua,shadow_color:[0,0.15,0.15,1],plain:true},"/",{storage:"demolition:settings",nbt:"block_limit",plain:true}]
scoreboard players display numberformat $cells demolition_p2_stats fixed [{storage:"demolition:building",nbt:"all.p2_cells",color:aqua,shadow_color:[0,0.15,0.15,1],plain:true},"/",{storage:"demolition:settings",nbt:"cell_limit",plain:true}]

# Warning score displays
execute if predicate demolition:build/p2_exceed_blast run scoreboard players display numberformat $blast demolition_p2_stats fixed [{text:"",color:aqua,shadow_color:[0,0.15,0.15,1]},{storage:"demolition:temp",nbt:"all.p2_blast_display",color:red,shadow_color:[0.3,0,0,1],interpret:true},"/",{storage:"demolition:temp",nbt:"all.blast_limit_display",interpret:true}]
execute if predicate demolition:build/p2_exceed_blocks run scoreboard players display numberformat $blocks demolition_p2_stats fixed [{text:"",color:aqua,shadow_color:[0,0.15,0.15,1]},{storage:"demolition:building",nbt:"all.p2_blocks",color:red,shadow_color:[0.3,0,0,1],plain:true},"/",{storage:"demolition:settings",nbt:"block_limit",plain:true}]
execute if predicate demolition:build/p2_exceed_cells run scoreboard players display numberformat $cells demolition_p2_stats fixed [{text:"",color:aqua,shadow_color:[0,0.15,0.15,1]},{storage:"demolition:building",nbt:"all.p2_cells",color:red,shadow_color:[0.3,0,0,1],plain:true},"/",{storage:"demolition:settings",nbt:"cell_limit",plain:true}]

# Warn player if any of their stats are over-limit
execute if predicate {type:any_of,terms:["demolition:build/p2_exceed_blast","demolition:build/p2_exceed_blocks","demolition:build/p2_exceed_cells"]} unless predicate demolition:build/has_unblastable_block as @a[team=demolition_team_2] at @s run function demolition:zzz/notif/actionbar_red {text:"Remove blocks to bring down your Build Stats."}

# Update cached build
$execute positioned $(p2_build_plate_x) $(p2_build_plate_y) $(p2_build_plate_z) run clone ~ ~ ~ ~20 ~11 ~26 $(p2_cache_x) $(p2_cache_y) $(p2_cache_z) strict

# Update HUD Block Count
function demolition:zzz/game/demolition/block_count with storage demolition:data
function demolition:zzz/hud/update