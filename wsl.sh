
alias f="command fdfind"

export FZF_ALT_C_COMMAND="command fdfind"


alias adb="adb.exe"
alias node="node.exe"

# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh
# alias open='explorer.exe $(wslpath -w "$PWD")'
# alias open='cmd.exe /c start \"\" $(wslpath -w "${p}")'
function open() {
  local p=${1:-.}
  cmd.exe /c start "" "$(wslpath -w ${p})" &>/dev/null
}
