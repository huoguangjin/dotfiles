#!/usr/bin/env bash
set -euo pipefail

cat <<EOF
==================== AppStore app ====================
iShot
iOCR
==================== other app ====================
https://developer.android.google.cn/studio
https://karabiner-elements.pqrs.org
https://antares-sql.app/
EOF

export HOMEBREW_NO_AUTO_UPDATE=1

brew update

brew install wget
brew install tree
brew install ag
brew install rg
brew install git-lfs
brew install coreutils
brew install iterm2
brew install google-chrome
brew install utools
brew install hammerspoon
brew install pyenv
brew install pipx
brew install jq
brew install aria2
brew install ouch
brew install yazi

brew install cmake
brew install ninja
brew install docker

brew install visual-studio-code
brew install topnotch
brew install alt-tab
brew install nvalt
brew install iina
brew install ImageOptim
brew install hexyl
brew install ImHex
brew install HandBrake
brew install TablePlus
# brew install BetterAndBetter
# brew install gimp
# brew install qbittorrent
# brew install telegram
# brew install sublime-text
# brew install sublime-merge

brew install qq
brew install wechat
brew install qqmusic
brew install neteasemusic
# brew install youdaodict

pipx install poetry
pipx install ipython
pipx install black
pipx install ranger-fm
pipx install conan
