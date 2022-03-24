#!/usr/bin/env bash
set -euo pipefail

cli=(
  git
  git-lfs
  # svn
  vim
  wget
  tree
  rg
  fd
  fzf
  ranger
  bat
  tldr

  pyenv
  pipx

  node
  # nvm

  cmake
  conan
  ninja

  # qt

  docker

  # jadx
  # ffmpeg

  # sqlite
  # mysql

  # corkscrew

  qrencode
  unar

  jq

  hexyl
)

# https://command-not-found.com/
cli_install() {
  brew install "$@"
}

cli_install "${cli[@]}"

