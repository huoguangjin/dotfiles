#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(dirname "$0")/.."

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup/hammerspoon \
  "$DOTFILES"/hammerspoon/ \
  "$HOME"/.hammerspoon
