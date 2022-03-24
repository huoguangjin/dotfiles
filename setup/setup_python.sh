#!/usr/bin/env bash
set -euo pipefail

pipx install poetry
poetry config virtualenvs.in-project true

pyenv install 3.9.5
pyenv install 2.7.18
pyenv rehash
pyenv global 3.9.5 2.7.18

pipx install ipython

