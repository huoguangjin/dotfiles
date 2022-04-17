#!/usr/bin/env bash
set -euo pipefail

export DOTFILES="$(dirname $0)/.."

rsync -arcvn \
  -b --backup-dir "$DOTFILES"/backup/karabiner/complex_modifications \
  "$DOTFILES"/karabiner/complex_modifications/ \
  "$HOME"/.config/karabiner/assets/complex_modifications
