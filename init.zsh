export DOTFILES="$(dirname "$0")"
# export XDG_CONFIG_HOME="$DOTFILES"

source $DOTFILES/flag.sh

source $DOTFILES/alias.sh

source $DOTFILES/env.sh

source $DOTFILES/fun.sh

source $DOTFILES/fzf_fun.sh

source $DOTFILES/bind.zsh

[ -f $DOTFILES/tx.sh ] && source $DOTFILES/tx.sh

export PATH="$PATH:$DOTFILES/bin"
