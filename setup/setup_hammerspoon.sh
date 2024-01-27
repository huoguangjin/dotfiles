#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(realpath "$0"/../..)

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup/hammerspoon \
  "$DOTFILES"/hammerspoon/ \
  "$HOME"/.hammerspoon
