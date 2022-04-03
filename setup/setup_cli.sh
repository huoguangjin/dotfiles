#!/usr/bin/env bash
set -euo pipefail

cli=(
  zsh
  git
  git-lfs
  coreutils
  # svn
  vim
  wget
  tree
  ag
  rg
  fd
  fzf
  ranger
  bat
  git-delta
  tldr
  aria2

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
