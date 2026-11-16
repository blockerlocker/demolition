team leave @s
team join demolition_team_2

tellraw @a [{selector:"@s",color:green},{text:" has joined ",color:yellow},{text:"Team 2",color:blue}]
execute as @a at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1