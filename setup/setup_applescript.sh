#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(cd "$(dirname "$0")/.."; pwd -P)

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup/applescript \
  "$DOTFILES"/applescript/ \
  "$DOTFILES"/local/applescript

echo "
Drag *.app from $DOTFILES/local/applescript to $HOME
"

open "$HOME"
open "$DOTFILES"/local/applescript
