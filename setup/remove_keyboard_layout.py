#!/usr/bin/env python3
import plistlib
import shutil
from pathlib import Path


def remove_keyboard_layout(data, target_id):
    if isinstance(data, dict):
        if data.get("KeyboardLayout ID") == target_id:
            return None

        new_dict = {}
        for k, v in data.items():
            v = remove_keyboard_layout(v, target_id)
            if v is not None:
                new_dict[k] = v

        return new_dict
    elif isinstance(data, list):
        new_list = []
        for v in data:
            v = remove_keyboard_layout(v, target_id)
            if v is not None:
                new_list.append(v)

        return new_list
    else:
        return data


plist = Path("~/Library/Preferences/com.apple.HIToolbox.plist").expanduser()
backup = Path(str(plist) + ".bak")
if not backup.exists():
    print(f"backup: {backup}")
    shutil.copy(plist, backup)

keyboard_layout_abc_id = 252
pl = plistlib.loads(plist.read_bytes())
new_pl = remove_keyboard_layout(pl, keyboard_layout_abc_id)
plist.write_bytes(plistlib.dumps(new_pl, fmt=plistlib.FMT_BINARY))
