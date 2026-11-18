data merge storage demolition:demolition {all:{turn:p1}}

execute store result storage demolition:temp all.team_count int 1 if entity @a[team=demolition_team_1]

data modify storage demolition:temp all.team_name set value {text:"Team 1",color:red}
execute if data storage demolition:temp all{team_count:1} run data modify storage demolition:temp all.team_name set value {selector:"@p[team=demolition_team_1]",color:red}

tellraw @a [{storage:"demolition:temp",nbt:"all.team_name",interpret:true},{text:"'s "},{text:"turn",color:yellow}]