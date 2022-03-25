#!/usr/bin/env bash
set -euo pipefail

export HOMEBREW_NO_AUTO_UPDATE=1

brew update

cask=(
  google-chrome
  iterm2
  karabiner-elements
  keyboard-maestro
  moom
  v2rayu
  deepl
  aria2gui
  iina
  qbittorrent
  youdaodict
  # jetbrains-toolbox
  sublime-text
  sublime-merge
  visual-studio-code
  nvalt
  # qq
  # qqmusic
  # gimp
  # telegram
)
brew install --cask "${cask[@]}"

brew tap adoptopenjdk/openjdk
openjdk=(
  adoptopenjdk8
  adoptopenjdk11
)
brew install --cask "${openjdk[@]}"
