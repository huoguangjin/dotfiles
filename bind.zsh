#bindkey -v

bindkey "^K" push-line-or-edit

# "^W" autopair-delete-word
# "^X^B" vi-match-bracket
# "^X^J" vi-join
# "^X^u" undo
# "^H" autopair-delete
# "^X^V" vi-cmd-mode

bindkey "^F" forward-word
bindkey "^B" backward-word
bindkey "^S" backward-word
bindkey "^D" forward-word

bindkey -s "^Q" " | grep"
bindkey -s "^V" " | v -"

# add/remove sudo
# https://a-wing.top/shell/2021/05/10/zsh-config
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  local cmd="sudo "
  if [[ ${BUFFER} == ${cmd}* ]]; then
    CURSOR=$(( CURSOR-${#cmd} ))
    BUFFER="${BUFFER#$cmd}"
  else
    BUFFER="${cmd}${BUFFER}"
    CURSOR=$(( CURSOR+${#cmd} ))
  fi
  zle reset-prompt
}

# zle -N sudo-command-line
# bindkey "^S" sudo-command-line

ranger_cd() {
  local temp_file="$(mktemp -t "ranger_cd.${USERNAME}")"
  ranger --choosedir="$temp_file" -- "${@:-$PWD}"
  if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
    cd -- "$chosen_dir"
  fi
  rm -f -- "$temp_file"
}

bindkey -s "^N" "ranger_cd\n"
