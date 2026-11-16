execute as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 2 0.85
tellraw @a [{player:blockerlocker},{text:" > ",color:yellow},{text:"Team 1",color:red},{text:" is no longer ready.",color:yellow}]
data remove storage demolition:building all.p1_ready