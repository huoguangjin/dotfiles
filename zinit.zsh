export DOTFILES=${DOTFILES:=${0:h}}

typeset -A ZI
ZI[HOME_DIR]="${HOME}/.config/zi"
ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"
source "${ZI[BIN_DIR]}/zi.zsh"

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt multios

# setopt noclobber
setopt interactive_comments
setopt correct correctall

zi light z-shell/z-a-bin-gem-node

zi ice id-as="brew" \
  atclone='HOMEBREW_INSTALL_FROM_API=1 NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ -x /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv | tee init.zsh
  echo fpath+="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions" >> init.zsh
elif [[ -x /opt/local/bin/brew ]]; then
  /opt/local/bin/brew shellenv | tee init.zsh
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | tee init.zsh
else
  echo > init.zsh
fi
' \
  atpull='%atclone' run-atpull src"init.zsh" nocompile'!'
zi light z-shell/null

zi snippet OMZ::lib/functions.zsh
zi snippet OMZ::lib/termsupport.zsh

zi ice id-as
zi snippet "$DOTFILES"/breeze.zsh-theme


zi wait lucid light-mode for \
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


zi wait lucid id-as from'gh-r' light-mode for \
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


zi wait lucid light-mode for \
  atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  z-shell/F-Sy-H \
  blockf \
  zsh-users/zsh-completions \
  nocd atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \


zi wait lucid id-as depth'1' light-mode for \
  hlissner/zsh-autopair \


source "$DOTFILES"/init.zsh
