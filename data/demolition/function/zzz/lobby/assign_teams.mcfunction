execute positioned ~3 ~ ~ run tag @a[dx=28,dy=14,dz=34] add demolition_team_1
execute positioned ~-31 ~ ~ run tag @a[dx=28,dy=14,dz=34] add demolition_team_2

execute as @a[tag=demolition_team_1,team=!demolition_team_1] run function demolition:zzz/lobby/join_team_1
execute as @a[tag=demolition_team_2,team=!demolition_team_2] run function demolition:zzz/lobby/join_team_2

execute as @a[tag=!demolition_team_1,team=demolition_team_1] run function demolition:zzz/lobby/leave_team_1
execute as @a[tag=!demolition_team_2,team=demolition_team_2] run function demolition:zzz/lobby/leave_team_2