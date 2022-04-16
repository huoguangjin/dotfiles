#!/usr/bin/env bash
set -euo pipefail

export DOTFILES=$(cd "$(dirname "$0")/.."; pwd -P)

cp "$DOTFILES/keylayout/raindrop.keylayout" "$HOME/Library/Keyboard Layouts/"
