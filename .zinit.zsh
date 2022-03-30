
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZ::lib/termsupport.zsh

zinit wait lucid light-mode for \
  OMZ::lib/clipboard.zsh \
  OMZ::lib/completion.zsh \
  OMZ::lib/directories.zsh \
  OMZ::lib/history.zsh \
  OMZ::lib/key-bindings.zsh \
  OMZ::lib/spectrum.zsh \
  \
  OMZ::plugins/extract \
  OMZ::plugins/git \
  \
  as"completion" \
  OMZ::plugins/adb/_adb \
  as"completion" \
  OMZ::plugins/ag/_ag \
  as"completion" \
  OMZ::plugins/fd/_fd \
  \
  atinit"zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
  zsh-users/zsh-completions \


PS1="╭─$PS1
╰─$ "
setopt promptsubst
zinit wait'!' lucid for \
  OMZ::lib/git.zsh \
  OMZ::lib/prompt_info_functions.zsh \
  OMZ::lib/theme-and-appearance.zsh \
  OMZ::themes/bira.zsh-theme


export LANG=en_US.UTF-8

[ -f $HOME/dotfiles/init.zsh ] && source $HOME/dotfiles/init.zsh

