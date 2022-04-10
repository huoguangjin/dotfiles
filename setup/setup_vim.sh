#!/usr/bin/env bash
set -euo pipefail

mkdir -p $HOME/.cache/vim/{backup,swap,undo}

curl -fLo $HOME/.local/share/vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
