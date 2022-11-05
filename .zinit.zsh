export DOTFILES=${DOTFILES:=${0:h}}

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt multios

setopt interactivecomments


zinit ice id-as="brew" \
  atclone='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ -x /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv | tee brew.zsh && source brew.zsh
  echo fpath+="$(brew --prefix)/share/zsh/site-functions" >> brew.zsh
elif [[ -x /opt/local/bin/brew ]]; then
  /opt/local/bin/brew shellenv | tee brew.zsh
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | tee brew.zsh
else
  echo > brew.zsh
fi
source brew.zsh' \
  atpull='%atclone' run-atpull \
  nocompile'!'
zinit light zdharma-continuum/null

zinit snippet OMZ::lib/termsupport.zsh

zinit ice id-as
zinit snippet "$DOTFILES"/breeze.zsh-theme


zinit wait lucid light-mode for \
  OMZ::lib/clipboard.zsh \
  OMZ::lib/completion.zsh \
  OMZ::lib/history.zsh \
  OMZ::lib/key-bindings.zsh \
  OMZ::lib/spectrum.zsh \
  \
  OMZ::plugins/extract \
  OMZ::plugins/fancy-ctrl-z \
  OMZ::plugins/fzf \
  \
  as"completion" \
  OMZ::plugins/adb/_adb \
  \
  atinit"zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
  zsh-users/zsh-completions \


zinit wait lucid id-as depth'1' light-mode for \
  hlissner/zsh-autopair \
  skywind3000/z.lua \


source "$DOTFILES"/init.zsh
