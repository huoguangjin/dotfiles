import itertools
import shutil
import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path

plist = Path("~/Library/Preferences/com.apple.HIToolbox.plist").expanduser()
backup = Path(str(plist) + ".bak")
if not backup.exists():
    print(f"backup: {backup}")
    shutil.copy(plist, backup)

cmd = f"plutil -convert xml1 {plist} -o -"
content = subprocess.getoutput(cmd)

keyboard_layout_abc_id = "252"

root = ET.fromstring(content)
parent_nodes = root.findall(".//dict[key='KeyboardLayout ID']/..")
for parent_node in parent_nodes:
    dict_nodes = parent_node.findall("dict[key='KeyboardLayout ID']")
    for dict_node in dict_nodes:
        keyboard_layout = {
            key_node.text: value_node.text
            for key_node, value_node in itertools.batched(dict_node, 2)
        }

        if keyboard_layout["KeyboardLayout ID"] == keyboard_layout_abc_id:
            print(f"remove: {keyboard_layout=}")
            parent_node.remove(dict_node)

modified_content = ET.tostring(root)
plist.write_bytes(modified_content)
