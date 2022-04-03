#!/usr/bin/env bash
set -euo pipefail

# enable key repeating
defaults write -g ApplePressAndHoldEnabled -bool false

defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

killall Finder


# hide Dock immediately
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0

# System Preferences > Dock & Menu Bar > Dock & Menu Bar > Minimize windows using > Scale effect
defaults write com.apple.dock mineffect scale

killall Dock
