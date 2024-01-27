#!/usr/bin/env bash
set -euo pipefail

pyenv install 3.12.4
pyenv install 2.7.18
pyenv rehash
pyenv global 3.12.4 2.7.18

# https://pypa.github.io/pipx/docs/
export PIPX_DEFAULT_PYTHON=$(pyenv which python)

pipx install poetry
poetry config virtualenvs.in-project true

pipx install ipython
pipx install black
pipx install ranger-fm
pipx install conan
