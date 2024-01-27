#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(realpath "$0"/../..)

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup/karabiner/complex_modifications \
  "$DOTFILES"/karabiner/complex_modifications/ \
  "$HOME"/.config/karabiner/assets/complex_modifications

open -a Karabiner-Elements
