playsound block.note_block.pling master @s
tellraw @a ["",\
    {text:"--SETUP ITEMS--",color:green},\
    {text:"\n\nSummon Lobby:",color:yellow,underlined:true},\
    {text:"\n  This will spawn the full arena, but is only intended for choosing which side each player is on, and starting the game. It also serves as a cache where both players' builds will be stored during play.",color:yellow},\
    {text:"\n\nSummon P1 Arena:",color:yellow,underlined:true},\
    {text:"\n  This will spawn the Eastern side of the arena for Player 1. To prevent cheating, you should place it pretty far away from Player 2's arena.",color:yellow},\
    {text:"\n\nSummon P2 Arena:",color:yellow,underlined:true},\
    {text:"\n  This will spawn the Western side of the arena for Player 2. To prevent cheating, you should place it pretty far away from Player 1's arena.",color:yellow},\
    {text:"\n\nSummon Joint Arena:",color:yellow,underlined:true},\
    {text:"\n  Spawns the P1 Arena and P2 Arena connected instead of separate.",color:yellow},\
    "\n\n",\
    "\n",{player:blockerlocker},\
    {text:" > To play, each of the above items needs to be placed down.",color:aqua},\
]

clear @a *[custom_data~{demolition:{setup:true}}]
loot give @s loot demolition:summon_lobby
loot give @s loot demolition:summon_p1_arena
loot give @s loot demolition:summon_p2_arena
loot give @s loot demolition:summon_joint_arena