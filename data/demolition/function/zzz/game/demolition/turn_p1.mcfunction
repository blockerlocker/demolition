data merge storage demolition:demolition {all:{turn:p1}}

execute store result storage demolition:temp all.team_count int 1 if entity @a[team=demolition_team_1]

execute if data storage demolition:temp all{team_count:1} run tellraw @a [{selector:"@p[team=demolition_team_1]",color:red},{text:"'s "},{text:"turn",color:yellow}]
execute unless data storage demolition:temp all{team_count:1} run tellraw @a [{text:"Team 1's ",color:red},{text:"turn",color:yellow}]