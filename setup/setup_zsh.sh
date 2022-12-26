#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(dirname "$0")/.."

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname "$ZINIT_HOME")"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup \
  "$DOTFILES"/.zshrc \
  "$HOME"/.zshrc

zsh
