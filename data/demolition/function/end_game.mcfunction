scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay sidebar.team.blue

function demolition:zzz/reset/players
function demolition:zzz/reset/data
function demolition:zzz/reset/panel_icons

execute as @a run function demolition:zzz/notif/chat_yellow {text:'"Game ended early."'}