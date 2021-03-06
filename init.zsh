export DOTFILES="$(dirname "$0")"
# export XDG_CONFIG_HOME="$DOTFILES"

source $DOTFILES/flag.sh

source $DOTFILES/alias.sh

source $DOTFILES/env.sh

source $DOTFILES/fun.sh

source $DOTFILES/fzf_fun.sh

[ -f $DOTFILES/tx.sh ] && source $DOTFILES/tx.sh

# key binding
bindkey '^k' push-line-or-edit

export PATH="$PATH:$DOTFILES/bin"
