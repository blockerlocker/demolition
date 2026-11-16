execute on target unless entity @s[tag=demolition_interact_player] run return run data remove entity @s attack

data modify entity @s interaction set from entity @s attack
function demolition:zzz/panel/button/main

data remove entity @s interaction
data remove entity @s attack