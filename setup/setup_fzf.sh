#!/usr/bin/env bash
set -euo pipefail

$(brew --prefix fzf)/install \
  --xdg \
  --completion \
  --no-key-bindings \
  --no-update-rc \
  --no-bash

source $HOME/.config/fzf/fzf.zsh
