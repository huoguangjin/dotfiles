#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(realpath "$0"/../..)

cp "$DOTFILES/keylayout/raindrop.keylayout" "$HOME/Library/Keyboard Layouts/"

echo "Open System Preferences and change input source:
Preferences > Keyboard > Input Sources > Add > Others > raindrop
"
open -b com.apple.systempreferences /System/Library/PreferencePanes/Keyboard.prefPane

# change default keyboard layout
# https://apple.stackexchange.com/questions/44921/how-to-remove-or-disable-a-default-keyboard-layout
echo "Run remove_keyboard_layout.py to remove default keyboard layout ABC:
python3 ${DOTFILES}/setup/remove_keyboard_layout.py

Then reboot you computer
"
