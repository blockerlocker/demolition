tag @s add demolition_queue_state_change
data merge entity @s {text:{sprite:"block/tnt_side",atlas:blocks,color:white},transformation:{scale:[2.8125,2.8125,0],translation:[-0.0703125,-0.421875,0]}}
kill @e[type=text_display,tag=demolition_icon_count,distance=..0.1]