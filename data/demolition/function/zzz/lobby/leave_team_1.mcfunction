team leave @s

tellraw @a [{selector:"@s",color:green},{text:" has left ",color:yellow},{text:"Team 1",color:red}]
execute as @a at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 0.85