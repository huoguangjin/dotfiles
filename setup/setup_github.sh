#!/usr/bin/env bash
set -euo pipefail

output_key="$HOME/.ssh/github_ed25519"

ssh-keygen -t ed25519 -C "hgj@hgj" -f $output_key

echo "
# ssh -T git@github.com
Host github.com
  Hostname github.com
  User git
  IdentityFile $output_key
" >> $HOME/.ssh/config

echo "========================================"
cat "${output_key}.pub"
echo "========================================"

read -p "add public key to https://github.com/settings/keys. ok? >"

ssh -T git@github.com
