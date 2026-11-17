data merge storage demolition:demolition {all:{turn:p2}}

execute store result storage demolition:temp all.team_count int 1 if entity @a[team=demolition_team_2]

execute if data storage demolition:temp all{team_count:1} run tellraw @a [{selector:"@p[team=demolition_team_2]",color:blue},{text:"'s "},{text:"turn",color:yellow}]
execute unless data storage demolition:temp all{team_count:1} run tellraw @a [{text:"Team 2's ",color:blue},{text:"turn",color:yellow}]