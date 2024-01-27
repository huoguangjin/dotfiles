#!/usr/bin/env bash
set -euo pipefail

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /opt/local/bin/brew ]]; then
  eval "$(/opt/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  function brew() {
    echo ">> brew not found"
  }
fi

echo ">> brew shellenv"
brew shellenv

# cd $(brew --repo)/Library/Taps/homebrew # cd /opt/homebrew/Library/Taps/homebrew
# git clone --depth=1 https://github.com/Homebrew/homebrew-core.git
# git clone --depth=1 https://github.com/Homebrew/homebrew-cask.git
# git -C homebrew-core fetch --unshallow
# git -C homebrew-cask fetch --unshallow

#git -C $(brew --repo) gc --aggressive --prune
#git -C $(brew --repo)/Library/Taps/homebrew/homebrew-core gc --aggressive --prune
#git -C $(brew --repo)/Library/Taps/homebrew/homebrew-cask gc --aggressive --prune
