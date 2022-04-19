#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(cd "$(dirname "$0")/.."; pwd -P)

add_git_config_if_absent() {
  local name=$1
  local value=$2
  git config --global --get-all "$name" | grep "$value" &>/dev/null \
    || git config --global --add "$name" "$value"
}

add_git_config_if_absent include.path "$DOTFILES"/.gitconfig
add_git_config_if_absent core.excludesfile "$DOTFILES"/.gitignore_global
