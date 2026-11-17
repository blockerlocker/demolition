execute if data storage demolition:state {current_state:setup} run return run function demolition:zzz/notif/chat_yellow {text:'{text:"Cannot start game while in setup mode! Run "},{text:"/function demolition:setup/end",color:green,click_event:{action:run_command,command:"/function demolition:setup/end"}},{text:" to end setup."}'}
execute if data storage demolition:state {current_state:active} run return run function demolition:zzz/notif/chat_yellow {text:'{text:"Cannot pick teams when game is active! Run "},{text:"/function demolition:end_game",color:green,click_event:{action:run_command,command:"/function demolition:end_game"}},{text:" to end the game early."}'}
execute if data storage demolition:state {current_state:lobby} run return run function demolition:zzz/notif/chat_yellow {text:'"You are already picking teams! Wrong command, huh?"'}

execute unless entity @e[type=marker,tag=demolition_lobby] run return run function demolition:zzz/notif/chat_yellow {text:'{text:"Game cannot start without a Lobby! Run "},{text:"/function demolition:setup/begin",color:green,click_event:{action:run_command,command:"/function demolition:setup/begin"}},{text:" to start setup."}'}
execute unless entity @e[type=marker,tag=demolition_p1_arena] run return run function demolition:zzz/notif/chat_yellow {text:'{text:"Game cannot start without Player 1\'s Arena! Run "},{text:"/function demolition:setup/begin",color:green,click_event:{action:run_command,command:"/function demolition:setup/begin"}},{text:" to start setup."}'}
execute unless entity @e[type=marker,tag=demolition_p2_arena] run return run function demolition:zzz/notif/chat_yellow {text:'{text:"Game cannot start without Player 2\'s Arena! Run "},{text:"/function demolition:setup/begin",color:green,click_event:{action:run_command,command:"/function demolition:setup/begin"}},{text:" to start setup."}'}

execute at @n[type=marker,tag=demolition_lobby] positioned ~ ~15 ~ run tp @a ~ ~ ~ 0 45
gamemode adventure @a
clear @a
effect give @a resistance infinite 255 true
effect give @a saturation infinite 255 true
tag @a remove demolition_active_player

execute as @a at @s run playsound block.note_block.pling master @s ~ ~ ~ 2 2
tellraw @a ["\n",{player:blockerlocker},{text:" > Time to pick a side! Once everyone is ready, run ",color:yellow},{text:"/function demolition:start_game",color:green,click_event:{action:run_command,command:"/function demolition:start_game"}},{text:" to play!",color:yellow}]

function demolition:zzz/reset/clear_arena with storage demolition:data
function demolition:zzz/reset/hud_block_count with storage demolition:data

data merge storage demolition:state {current_state:lobby}