export DOTFILES=${DOTFILES:=${0:h}}

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt multios

# setopt noclobber
setopt interactive_comments
setopt correct correctall

zinit light zdharma-continuum/zinit-annex-bin-gem-node

zinit ice id-as="brew" \
  atclone='HOMEBREW_INSTALL_FROM_API=1 NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ -x /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv | tee brew.zsh
  echo fpath+="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions" >> brew.zsh
elif [[ -x /opt/local/bin/brew ]]; then
  /opt/local/bin/brew shellenv | tee brew.zsh
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | tee brew.zsh
else
  echo > brew.zsh
fi
' \
  atpull='%atclone' run-atpull src"brew.zsh" nocompile'!'
zinit light zdharma-continuum/null

zinit snippet OMZ::lib/functions.zsh
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
  OMZ::plugins/copypath \
  OMZ::plugins/extract \
  OMZ::plugins/fancy-ctrl-z \
  \
  MichaelAquilina/zsh-you-should-use \
  \
  as"completion" \
  OMZ::plugins/adb/_adb \


zinit wait lucid id-as from'gh-r' light-mode for \
  sbin'**/fd -> fd' @sharkdp/fd \
  atclone"./fzf --zsh > init.zsh" \
  atpull"%atclone" src"init.zsh" nocompile'!' \
  sbin'fzf' junegunn/fzf \
  sbin'**/delta -> delta' dandavison/delta \
  atclone"./zoxide init --cmd j zsh > init.zsh" \
  atpull"%atclone" src"init.zsh" nocompile'!' \
  sbin'**/zoxide -> zoxide' ajeetdsouza/zoxide \
  sbin'**/lazygit' jesseduffield/lazygit \
  sbin'**/fx* -> fx' @antonmedv/fx \
  atclone'cp -vf completions/exa.zsh _exa'  \
  sbin'**/exa -> exa' ogham/exa \
  # sbin'**/bat -> bat' @sharkdp/bat \


zinit wait lucid light-mode for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  blockf \
  zsh-users/zsh-completions \
  nocd atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \


zinit wait lucid id-as depth'1' light-mode for \
  hlissner/zsh-autopair \


source "$DOTFILES"/init.zsh
