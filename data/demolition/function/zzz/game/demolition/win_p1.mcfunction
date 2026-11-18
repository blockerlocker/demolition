execute as @a at @s run playsound entity.player.levelup master @s ~ ~ ~ 2 1

execute store result storage demolition:temp all.team_count int 1 if entity @a[team=demolition_team_1]

data modify storage demolition:temp all.team_name set value {text:"Team 1",color:red}
execute if data storage demolition:temp all{team_count:1} run data modify storage demolition:temp all.team_name set value {selector:"@p[team=demolition_team_1]",color:red}

execute as @a run function demolition:zzz/notif/subtitle {subtitle:[{storage:"demolition:temp",nbt:"all.team_name",interpret:true},{text:" wins!",color:green}]}
tellraw @a [{storage:"demolition:temp",nbt:"all.team_name",interpret:true},{text:" wins!",color:green}]

scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.blue

function demolition:zzz/reset/players
function demolition:zzz/reset/data
