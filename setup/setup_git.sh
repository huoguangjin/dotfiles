#!/usr/bin/env bash
set -euo pipefail

export DOT_FILE="$(dirname $0)/.."

backup_if_exist() {
  local f=$1
  if [ -e "$f" ]
  then
      echo ">> cp $f $DOT_FILE/backup"
      cp "$f" "$DOT_FILE/backup"
  fi
}

backup_if_exist $HOME/.gitconfig
cp $DOT_FILE/.gitconfig $HOME

backup_if_exist $HOME/.gitignore_global
cp $DOT_FILE/.gitignore_global $HOME

