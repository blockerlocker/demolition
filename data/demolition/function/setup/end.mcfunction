execute unless data storage demolition:state {current_state:setup} run return run function demolition:zzz/notif/chat_yellow {text:'{text:"You can\'t END setup mode if you\'re not IN setup mode! Run ",color:yellow},{text:"/function demolition:setup/begin",color:green,click_event:{action:run_command,command:"/function demolition:setup/begin"}},{text:" to start setup.",color:yellow}'}

playsound block.note_block.pling master @s
tellraw @a ["\n",{player:blockerlocker},{text:" > Ended setup mode. Run ",color:yellow},{text:"/function demolition:pick_teams",color:green,click_event:{action:run_command,command:"/function demolition:pick_teams"}},{text:" to begin playing!",color:yellow}]

clear @a *[custom_data~{demolition:{setup:true}}]
data merge storage demolition:state {current_state:none}