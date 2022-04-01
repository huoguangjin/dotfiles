#!/usr/bin/env bash
set -euo pipefail

output_key="$HOME/.ssh/github_ed25519"

user=$(whoami)
host=$(hostname)

ssh-keygen -t ed25519 -C "$user@$host" -f "$output_key"

echo "
# ssh -T git@github.com
Host github.com
  Hostname github.com
  User git
  IdentityFile $output_key
" >> $HOME/.ssh/config

echo "
Please add public key to https://github.com/settings/keys
========================================
$(cat "${output_key}.pub")
========================================
"

while true; do
  read -r -p "Test: ssh -T git@github.com (y/n)? " yn
  case $yn in
    [Yy]* ) ssh -T git@github.com; break;;
    * ) break;;
  esac
done
