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
alias rm="safe-rm"
alias ls="ls -G"
alias sl="ls"
alias lg="ls | grep"
alias llg="ll | grep"
alias lt="ls -lht"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias l="cd -"
alias mkdir="mkdir -p"
# alias tree="find . -print | sed -e "s;[^/]*/;|___;g;s;___|; |;g"

alias pc="pbcopy"
alias pp="pbpaste"

alias ipconfig="ifconfig"
alias ping="ping -c 5 "
alias xargs="xargs -tp"

alias v="vim"
alias vi="vim"
alias r="ranger -r $DOTFILES/.ranger"
# alias open="open ."
# alias item="open -a iTerm"
# alias st="open -a Sublime\ Text"
# alias chrome="open -a Google\ Chrome"
alias ip="ifconfig en1"
alias axel="axel -a"
alias cafe="caffeinate -ut"
alias tree="tree -CN"
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
#alias sd="sudo $(history \!\!)"
alias f="command fd"
# -i: ignore case, -I: ignore binary-file
alias grep="grep --color="auto" -iI"

alias adbresart="adb kill-server; echo '>> adb restart..'; adb start-server;"
alias killgradle="[[ -e ./gradlew ]] && ./gradlew --stop"
# alias rn="react-native"
# alias rnand="react-native run-android"
# alias vimbp="vim ~/.bash_profile"

alias py="python"
alias py2="python2"
alias py3="python3"
alias ipy="ipython"
alias ipy2="ipython2"
alias ipy3="ipython3"

# alias gst="git status -sb"
alias gd="git diff HEAD"
alias glg="git log --graph --decorate --abbrev-commit --all"
alias glgd="git log --graph --decorate --abbrev-commit --format=format:'%C(yellow)%h%C(reset) - %C(bold cyan)%cd%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gitclone1="git clone --depth=1"

alias cnpm="npm --registry=https://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=$HOME/configfile/.cnpmrc"

alias -s jar="java -jar"

alias kill_ds_store="find . -type f -name '.DS_Store' -ls -delete"

alias sst="svn status"
alias slg="svn log"
# alias slg="svn log $(svn info --show-item url)"
alias sfa="svn up"
alias scu="svn cleanup --remove-unversioned"
alias srv="svn revert -R"

alias distinct="cat -n | sort -uk2 | sort -nk1 | cut -f2-"

