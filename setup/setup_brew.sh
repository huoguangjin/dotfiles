#!/usr/bin/env bash
set -euo pipefail

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

echo ">> brew info"
which brew

# /opt/homebrew
brew --repo

# /opt/homebrew
brew --prefix

# cd $(brew --repo)/Library/Taps/homebrew # cd /opt/homebrew/Library/Taps/homebrew
# git clone --depth=1 https://github.com/Homebrew/homebrew-core.git
# git clone --depth=1 https://github.com/Homebrew/homebrew-cask.git
# git -C homebrew-core fetch --unshallow
# git -C homebrew-cask fetch --unshallow

