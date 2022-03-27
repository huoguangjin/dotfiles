#!/usr/bin/env bash
set -euo pipefail

pyenv install 3.10.3
pyenv install 2.7.18
pyenv rehash
pyenv global 3.10.3 2.7.18

# https://pypa.github.io/pipx/docs/
export PIPX_DEFAULT_PYTHON=$(pyenv which python)

pipx install poetry
poetry config virtualenvs.in-project true

pipx install ipython
pipx install black
