import os, sys, urllib.request, subprocess
from pathlib import Path

os.chdir(Path(__file__).resolve().parent)

if not Path("blpack.py").is_file():
    with open("blpack.py", "w", encoding="utf-8") as blpack_main:
        blpack_main.write(urllib.request.urlopen("https://raw.githubusercontent.com/blockerlocker/blpack/main/blpack.py").read().decode('utf-8'))

import blpack

MCVERSION = blpack.import_config_version()

config = blpack.import_config_settings()

def grab_module(module):
    with open(f"{module}.py", "w", encoding="utf-8") as module_main:
        module_main.write(urllib.request.urlopen(f"https://raw.githubusercontent.com/blockerlocker/blpack/main/{module}.py").read().decode('utf-8'))

def run_module(module):
    print(f"-Running module {module}")
    subprocess.run([sys.executable, f"{module}.py", MCVERSION])

config_modules = blpack.import_config_modules()

for module in config_modules:
    if not Path(f"{module}.py").is_file():
        grab_module(module)
    run_module(module)

ignore_modules = []
if "ignore" in config:
    ignore_modules = config["ignore"]

if not ignore_modules == "all":
    for file in Path("data").iterdir():
        file_module_name = f"data/{Path(file).name[:-3]}"
        if file.is_file() and file.suffix.lower() == ".py" and file_module_name not in config_modules and file_module_name not in ignore_modules:
            run_module(file_module_name)