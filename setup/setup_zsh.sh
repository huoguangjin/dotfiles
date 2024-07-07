#!/usr/bin/env bash
set -eu

DOTFILES=$(realpath "$0"/../..)

typeset -Ag ZI
typeset -gx ZI[HOME_DIR]="${HOME}/.config/zi"
typeset -gx ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"
command mkdir -p "$ZI[BIN_DIR]"

compaudit | xargs chown -R "$(whoami)" "$ZI[HOME_DIR]"
compaudit | xargs chmod -R go-w "$ZI[HOME_DIR]"
command git clone https://github.com/z-shell/zi.git "$ZI[BIN_DIR]" -b main --single-branch

rsync -arcv \
  -b --backup-dir "$DOTFILES"/backup \
  "$DOTFILES"/.zshrc \
  "$HOME"/.zshrc

exec zsh
