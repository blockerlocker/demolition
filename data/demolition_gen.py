import os, sys, urllib.request, subprocess
from pathlib import Path


### Debug ###
CACHE = False


os.chdir(Path(__file__).resolve().parent.parent)
sys.path.append(str(Path.cwd()))

if not Path(Path(__file__).resolve().parent).name == "data":
    print(f"!-This module must be stored within the 'data' folder of your pack to generate correctly!")
    input("Press Enter to exit program...")
    sys.exit()

if not Path("blpack.py").is_file():
    with open("blpack.py", "w", encoding="utf-8") as blpack_main:
        blpack_main.write(urllib.request.urlopen("https://raw.githubusercontent.com/blockerlocker/blpack/main/blpack.py").read().decode('utf-8'))

import blpack

MCVERSION = blpack.import_config_version()

blpack.remove_paths([
    "data/demolition/tags/block/blast_value",
    "data/demolition/tags/block/unblastable.json",
    "data/demolition/context_float_provider/total_blast_resistance.json",
    "data/demolition/context_int_provider/block_count.json"
])

TEMPDIR = ".demolition_temp"

blpack.import_libraries(MCVERSION,TEMPDIR)

all_jars = [str(library_jar) for library_jar in Path(f"{TEMPDIR}/libraries").rglob("*.jar")]
all_jars.append(f"{TEMPDIR}/versions/{MCVERSION}/server-{MCVERSION}.jar")

class_paths = os.pathsep.join([TEMPDIR,*all_jars])

subprocess.run(["javac", "-d", TEMPDIR, "-cp", class_paths, "block_stats.java"], check=True)
block_stats_out = subprocess.run(["java", "-cp", class_paths, "block_stats"], capture_output=True, text=True, check=True)

blast_map = {}
for line in block_stats_out.stdout.splitlines():
    block_id, hardness, blast_resistance = line.split(" ")[-3:]
    blast_map[block_id] = blast_resistance

blast_tags = {}
for block in blast_map:
    if not blast_map[block] in blast_tags:
        blast_tags[blast_map[block]] = [block]
    else:
        blast_tags[blast_map[block]].append(block)

unblastable_blocks = []
for blast_value in blast_tags:
    blpack.json_to_file({"values":blast_tags[blast_value]},"data/demolition/tags/block/blast_value",blast_value)
    if float(blast_value) > 10:
        unblastable_blocks.extend(blast_tags[blast_value])

blpack.json_to_file({"values":unblastable_blocks},"data/demolition/tags/block","unblastable")

total_blast_resistance = {
    "type": "add",
    "inputs": []
}

block_count = {
    "type": "add",
    "inputs": []
}

for x in range(0,20):
    for y in range(0,11):
        for z in range(0,26):
            block_count["inputs"].append({
                "type": "conditional",
                "condition": {
                    "type": "location_check",
                    "offsetX": x,
                    "offsetY": y,
                    "offsetZ": z,
                    "predicate": {
                        "block": {
                            "blocks": "#air"
                        }
                    }
                },
                "on_true": 0,
                "on_false": 1
            })
            
            for blast_value in blast_tags:
                total_blast_resistance["inputs"].append({
                    "type": "conditional",
                    "condition": {
                        "type": "location_check",
                        "offsetX": x,
                        "offsetY": y,
                        "offsetZ": z,
                        "predicate": {
                            "block": {
                                "blocks": f"#demolition:blast_value/{blast_value}"
                            }
                        }
                    },
                    "on_true": float(blast_value)
                })

blpack.json_to_file(block_count,"data/demolition/context_int_provider","block_count")
blpack.json_to_file(total_blast_resistance,"data/demolition/context_float_provider","total_blast_resistance")

if CACHE != True:
    blpack.remove_paths(TEMPDIR)
    blpack.remove_paths("logs")