execute if data storage demolition:state {current_state:active} run return run tellraw @s ["\n",{player:blockerlocker},{text:" > ... You'll probably break something if you try that right now... Run ",color:yellow},{text:"/function demolition:end_game",color:green,click_event:{action:run_command,command:"/function demolition:end_game"}},{text:" to end the game early.",color:yellow}]

function demolition:zzz/delete/lobby
function demolition:zzz/delete/p1_arena
function demolition:zzz/delete/p2_arena

forceload remove all