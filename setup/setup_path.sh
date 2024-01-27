#!/usr/bin/env bash
set -euo pipefail

export DOTFILES=$(realpath "$0"/../..)

mkdir -p /usr/local/{bin,lib}
mkdir -p /opt/local/{bin,lib}

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
# export PATH="/opt/homebrew/bin:$PATH"
