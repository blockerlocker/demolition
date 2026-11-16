execute if data storage demolition:state {current_state:active} run return run function demolition:zzz/notif/chat_yellow {text:'{text:"Cannot enter setup when game is active! Run ",color:yellow},{text:"/function demolition:end_game",color:green,click_event:{action:run_command,command:"/function demolition:end_game"}},{text:" to end the game early.",color:yellow}'}

playsound block.note_block.pling master @s
tellraw @a ["\n",{player:blockerlocker},{text:" > Entered setup mode. Run ",color:yellow},{text:"/function demolition:setup/items",color:green,click_event:{action:run_command,command:"/function demolition:setup/items"}},{text:" to start setting up.",color:yellow}]

data merge storage demolition:state {current_state:setup}