alias -g ..=".."
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

alias -- -="cd -"
alias 1="cd -1"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"
alias d="dirs -v | head"

alias cd..="cd .."
alias cd...="cd ../.."
alias cdtmp="cd ~/tmp"
alias cddot="cd ~/dotfiles"
alias cdnote="cd ~/note"

alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias rm="safe-rm"

alias ls="ls -G"
alias sl="ls"
alias lg="ls | grep"
alias llg="ll | grep"
alias lt="ls -lht"
alias ll="ls -lh"
alias la="ls -A"
alias lsa="ls -A"
alias lla="ls -lhA"
alias l="cd -"

alias v="vim"
alias r='ranger -r $DOTFILES/.ranger'
alias f="command fd"

alias grep="grep --color=auto -iI"
alias ping="ping -c 5 "
alias curl="curl -m 10"
alias xargs="xargs -tp"

alias axel="axel -a"
alias aria="aria2c --split=8 --max-concurrent-downloads=8 --max-connection-per-server=8"
alias cafe="caffeinate -ut"

alias ipconfig="ifconfig"
alias ip="ifconfig en1"

alias pc="clipcopy"
alias pp="clippaste"

alias tree="tree -CN"
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
#alias sd="sudo $(history \!\!)"

alias py="python"
alias py2="python2"
alias py3="python3"
alias ipy="ipython"
alias ipy2="ipython2"
alias ipy3="ipython3"

alias g="git"
alias gd="git diff"
alias gdh="git diff HEAD"
alias gds="git diff --staged"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcl="git clean -xdfn"
alias gitclone1="git clone --depth=1"
alias glg="git log --graph --decorate --abbrev-commit --all"
alias gls="git log --graph --stat" # -p: preview
alias grb="git rebase"
alias grs="git restore"
alias grss="git restore --staged"
alias gsh="git show"
alias gst="git status" # -s: summary

alias sst="svn status"
alias slg="svn log"
alias sfa="svn up"
alias scu="svn cleanup --remove-unversioned"
alias srv="svn revert -R"

alias ppath='echo -e ${PATH//:/\\n}'
alias distinct="cat -n | sort -uk2 | sort -nk1 | cut -f2-"

alias -g \\g="| grep"
alias -g \\h="| head"
alias -g \\b="| bat"
alias -g \\l="| less"
alias -g \\c="| clipcopy"
alias -g \\t="| tee"
alias -g \\v="| vim -"
alias -g \\s="2>&1"
alias -g \\hh="--help"

alias -s jar="java -jar"
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s gz="tar tf"

alias httpserver="npx http-server"
alias adbresart="adb kill-server; echo '>> adb restart..'; adb start-server;"
alias adbl="adb logcat"
alias adblg="adb logcat | grep"
alias adbc="adb logcat -c"
alias adbf='adb logcat > log_$(date +"%m%d_%H%M%S").txt'
alias adbt='adb logcat | tee log_$(date +"%m%d_%H%M%S").txt'
alias adbtg='adb logcat | tee log_$(date +"%m%d_%H%M%S").txt | grep'
alias adbfc="adbc && adbf"
alias adbcf="adbfc"
alias adbs='adb shell "screencap -p >&1" > screenshot_$(date +"%m%d_%H%M").png'
alias cnpm="npm --registry=https://registry.npmmirror.com"
alias gradlestop="[[ -e ./gradlew ]] && ./gradlew --stop"
alias kill_ds_store="find . -type f -name '.DS_Store' -ls -delete"
