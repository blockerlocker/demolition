execute as @a at @s run playsound entity.player.levelup master @s ~ ~ ~ 2 1

execute store result storage demolition:temp all.team_count int 1 if entity @a[team=demolition_team_2]

execute if data storage demolition:temp all{team_count:1} as @a run function demolition:zzz/notif/subtitle {subtitle:[{selector:"@p[team=demolition_team_2]",color:blue},{text:" wins!",color:green}]}
execute if data storage demolition:temp all{team_count:1} run tellraw @a [{selector:"@p[team=demolition_team_2]",color:blue},{text:" wins!",color:green}]
execute unless data storage demolition:temp all{team_count:1} as @a run function demolition:zzz/notif/subtitle {subtitle:[{text:"Team 2",color:blue},{text:" wins!",color:green}]}
execute unless data storage demolition:temp all{team_count:1} run tellraw @a [{text:"Team 2",color:blue},{text:" wins!",color:green}]

scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.blue

function demolition:zzz/reset/players
function demolition:zzz/reset/data
