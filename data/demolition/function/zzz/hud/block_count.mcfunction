rotate @s ~ ~
$data merge entity @s {Tags:[demolition_block_count,demolition_hud,demolition_$(player)_hud],shadow:true,background:0,alignment:center,transformation:{scale:[4,4,4]}}
data merge entity @s {text:[\
    {text:"Remaining Blocks:",color:green},\
    {text:"\nTeam 1: ",color:red},\
    {text:"0",color:gold},\
    {text:"\nTeam 2: ",color:blue},\
    {text:"0",color:gold},\
    ]}