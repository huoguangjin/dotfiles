export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export LSCOLORS="Gxfxcxdxbxegedabagacad"

# vim
export VIMINIT="source $DOTFILES/vim/vimrc"

# fzf
export FZF_BASE=${commands[fzf]}
export FZF_ALT_C_COMMAND="command fd"

export HOMEBREW_NO_AUTO_UPDATE=1

export RIPGREP_CONFIG_PATH=$DOTFILES/.ripgreprc

export PYTHONUNBUFFERED=1
export PYTHONBREAKPOINT="ipdb.set_trace()"

# ipython
export IPYTHONDIR="$DOTFILES/.ipython"

export PIPENV_VENV_IN_PROJECT=1

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE
