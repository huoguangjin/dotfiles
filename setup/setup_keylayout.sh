#!/usr/bin/env bash
set -euo pipefail

export DOTFILES=$(cd "$(dirname "$0")/.."; pwd -P)

cp "$DOTFILES/keylayout/raindrop.keylayout" "$HOME/Library/Keyboard Layouts/"

echo "Open System Preferences and change input source:
Preferences > Keyboard > Input Sources > Add > Others > raindrop
"
open -b com.apple.systempreferences /System/Library/PreferencePanes/Keyboard.prefPane
