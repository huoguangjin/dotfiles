
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt interactivecomments


zinit ice id-as="brew" \
  atclone='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ -x /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv | tee brew.zsh
elif [[ -x /opt/local/bin/brew ]]; then
  /opt/local/bin/brew shellenv | tee brew.zsh
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | tee brew.zsh
else
  echo > brew.zsh
fi' \
  atpull='%atclone' run-atpull \
  nocompile'!'
zinit light zdharma-continuum/null

zinit snippet OMZ::lib/termsupport.zsh

zinit wait lucid light-mode for \
  OMZ::lib/clipboard.zsh \
  OMZ::lib/completion.zsh \
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


[ -f $HOME/dotfiles/init.zsh ] && source $HOME/dotfiles/init.zsh
