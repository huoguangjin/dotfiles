#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(realpath "$0"/../..)

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup/applescript \
  "$DOTFILES"/applescript/ \
  "$DOTFILES"/local/applescript

echo "
Drag *.app from $DOTFILES/local/applescript to $HOME
"

open "$HOME"
open "$DOTFILES"/local/applescript
