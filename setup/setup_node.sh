#!/usr/bin/env bash
set -euo pipefail

npm config set cache --global ~/.cache/npm
[[ -d ~/.npm ]] && mv ~/.npm ~/.cache/npm

npm i -g yarn

yarn global add safe-rm
