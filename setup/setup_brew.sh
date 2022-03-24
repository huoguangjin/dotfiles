#!/usr/bin/env bash
set -euo pipefail

mkdir -p /usr/local/{bin,lib}
mkdir -p /opt/local/{bin,lib}

# brew --prefix # /opt/homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:$PATH"

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# cd $(brew --repo)/Library/Taps/homebrew # cd /opt/homebrew/Library/Taps/homebrew
# git clone --depth=1 https://github.com/Homebrew/homebrew-core.git
# git clone --depth=1 https://github.com/Homebrew/homebrew-cask.git
# git -C homebrew-core fetch --unshallow
# git -C homebrew-cask fetch --unshallow

