tag @e[type=text_display,tag=demolition_icon] remove demolition_queue_state_change
execute as @e[type=text_display,tag=demolition_icon] run data merge entity @s {text:{sprite:"container/bundle/bundle_progressbar_border",atlas:gui,color:green},transformation:{scale:[3.75,3.75,0],translation:[-0.09375,-0.5625,0]}}
execute as @e[type=text_display,tag=demolition_icon] run data remove entity @s data.demolition.total_destroyed
kill @e[type=text_display,tag=demolition_icon_count]