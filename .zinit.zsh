
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# zinit snippet OMZ::lib/bzr.zsh
# zinit snippet OMZ::lib/cli.zsh
zinit snippet OMZ::lib/clipboard.zsh
# zinit snippet OMZ::lib/compfix.zsh
zinit snippet OMZ::lib/completion.zsh
# zinit snippet OMZ::lib/correction.zsh
# zinit snippet OMZ::lib/diagnostics.zsh
zinit snippet OMZ::lib/directories.zsh
# zinit snippet OMZ::lib/functions.zsh
# zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
# zinit snippet OMZ::lib/misc.zsh
# zinit snippet OMZ::lib/nvm.zsh
zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/termsupport.zsh

zinit snippet OMZ::plugins/git

zinit ice as="completion"
zinit snippet OMZ::plugins/ag/_ag

zinit ice as="completion"
zinit snippet OMZ::plugins/fd/_fd



zinit wait lucid light-mode for \
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

