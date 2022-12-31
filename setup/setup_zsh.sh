#!/usr/bin/env bash
set -eu

DOTFILES="$(dirname "$0")/.."

NO_INPUT=1 NO_ANNEXES=1 NO_EDIT=1 NO_TUTORIAL=1 \
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup \
  "$DOTFILES"/.zshrc \
  "$HOME"/.zshrc

exec zsh
