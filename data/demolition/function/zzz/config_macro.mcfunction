$dialog show @s {\
    "type": "minecraft:multi_action",\
    "title": "Demolition Settings",\
    "inputs": [\
        {\
            "type": "minecraft:text",\
            "key": "blast_limit",\
            "width": 125,\
            "label": {\
                "text": "Blast Resistance Limit",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "The total combined Blast Resistance your build can have."\
                }\
            },\
            "initial": "$(blast_limit)"\
        },\
        {\
            "type": "minecraft:text",\
            "key": "block_limit",\
            "width": 125,\
            "label": {\
                "text": "Block Limit",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "The total number of blocks your build can have."\
                }\
            },\
            "initial": "$(block_limit)"\
        },\
        {\
            "type": "minecraft:text",\
            "key": "cell_limit",\
            "width": 125,\
            "label": {\
                "text": "Cell Limit",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "The total number of cells your build can take up."\
                }\
            },\
            "initial": "$(cell_limit)"\
        }\
    ],\
    "actions": [\
        {\
            "label": "Save",\
            "width": 100,\
            "action": {\
                "type": "minecraft:dynamic/run_command",\
                "template": "data merge storage demolition:settings {blast_limit:\u0024(blast_limit),block_limit:\u0024(block_limit),cell_limit:\u0024(cell_limit)}"\
            }\
        }\
    ]\
}