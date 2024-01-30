
# key-bindings.zsh
# CTRL-G - cd into the selected directory
# bindkey '^G' fzf-cd-widget
# CTRL-T - Paste the selected file path(s) into the command line
# bindkey '^T' fzf-file-widget
# CTRL-R - Paste the selected command from history into the command line
# bindkey '^R' fzf-history-widget

# fe - open file with vim
# fd - cd to selected directory
# fo - open file
# vg - edit file which contains given text
# cdf - deprecated: use fe+ctrl-d instead - cd to the directory of selected file
# fda - cd to selected directory including hidden directories
# fz - cd to the directory of selected file from z history

bindkey '^G' fzf-cd-widget

fz() {
  local out
  # IFS=$'\n' out=$(zsh $ZSH/plugins/z/z.sh -l | cut -c 12- | fzf -q "$1" -m --select-1  --height 40% \
  IFS=$'\n' out=$(z -l | cut -c 12- | fzf -q "$1" -m --select-1  --height 40% \
    --preview 'tree -C {} | head -100' --expect=ctrl-o,ctrl-r,ctrl-x)
  key=$(head -1 <<< "$out")
  files=$(tail +2 <<< "$out")
  echo ">out=$out<"
  echo ">key=$key<"
  echo ">files=$files<"
  if ! [ -n "$key" ]; then
    dir="$(head -1 <<< $files)"
    cd "${dir:-.}"
  else
    if [ "$key" = ctrl-o ]; then
      echo "    \x1b[1Aopen $files"
      open "$files"
    elif [ "$key" = ctrl-r ]; then
      z -r "$files"
    elif [ "$key" = ctrl-x ]; then
      z -x "$files"
      echo z -x "$files"
    else
      echo cdddddddd
      dir="$(head -1 <<< $files)"
      cd "${dir:-.}"
    fi
  fi
  echo debug
  echo debug
}

fe() {
  local key files dir
  IFS=$'\n' out=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 \
      --preview='bat --style=numbers --color=always --line-range :500 {}' --expect=ctrl-o,ctrl-d))
  key=$(head -1 <<< "$out")
  files=$(tail +2 <<< "$out")
  if [ -n "$files" ]; then
    if [ "$key" = ctrl-o ]; then
      dir=$(dirname "$(head -1 <<< $files)")
      echo "    \x1b[1Aopen $dir"
      open "$dir"
    elif [ "$key" = ctrl-d ]; then
      dir=$(dirname "$(head -1 <<< $files)")
      echo "    \x1b[1Acd $dir"
      cd "$dir"
    else
      ${EDITOR:-vim} "${files[@]}"
    fi
  elif [ -n "$out" ]; then
    ${EDITOR:-vim} "$out"
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} \
      ! -path '*/\.*' ! -path '*/build/*' \
      -type d -print 2> /dev/null \
      | fzf +m --preview 'tree -C {} -I "build" | head -100') \
      && cd "$dir"
}

# fo - open file
# <c-o> to "open file"
# <c-e> to "vim file"
fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# ft - edit file which contains given text
ft() {
  local file
  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"

  if [[ -n "$file" ]]; then
     eval vim "$file"
  fi
}

fl() {
  git ll --color=always "$@" |
  fzf -m --reverse --no-sort --ansi \
    --height 100% --min-height 20 --border \
    --bind=ctrl-p:toggle-preview \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --stat --format=fuller --color=always' \
    --bind='ctrl-m:execute:
            git -c core.pager="LESS=-R delta --paging=always" show $(grep -o "[a-f0-9]\{7,\}" <<< {} | head -1)'
}

_gl() {
  git ll --color=always "$@" |
  fzf -m --reverse --no-sort --ansi \
    --height 50% --min-height 20 --border \
    --bind=ctrl-p:toggle-preview \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --stat --format=fuller --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

fzf-gl-widget() {
  local result=$(_gl "$@" | paste -sd " " -)
  local ret=$?
  zle reset-prompt
  LBUFFER+=$result
  return $ret
}
zle -N fzf-gl-widget
bindkey '^G^L' fzf-gl-widget

_gs() {
  git -c color.status=always status -s "$@" |
  fzf -m --nth 2..,.. \
    --ansi \
    --height 50% --min-height 20 --border \
    --bind=ctrl-p:toggle-preview \
    --bind='ctrl-/:change-preview-window(50%|hidden|)' \
    --preview 'git diff --color=always -- {-1} | sed 1,4d; bat {-1}' |
  cut -c4- | sed 's/.* -> //'
}

fzf-gs-widget() {
  local result=$(_gs "$@" | paste -sd " " -)
  local ret=$?
  zle reset-prompt
  LBUFFER+=$result
  return $ret
}
zle -N fzf-gs-widget
bindkey '^G^S' fzf-gs-widget

fzf-history-widget () {
	local selected num
	setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
	selected=($(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS
    --query=${(qqq)LBUFFER} +m" $(__fzfcmd)))
	local ret=$?
	if [ -n "$selected" ]
	then
		num=$selected[1]
		if [ -n "$num" ]
		then
			zle vi-fetch-history -n $num
		fi
	fi
	zle reset-prompt
	return $ret
}

# fda - cd to selected directory including hidden directories
# fda() {
#   local dir
#   dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
# }

# cdf - cd to the directory of selected file
cdf() {
  local file dir
  file=$(fzf +m -q "$1" --preview 'tree -C $(dirname {}) | head -100') && dir=$(dirname "$file") && cd "$dir"
}

ff() {
  local dir=$(tail -r "$DOTFILES"/quick/dirs | fzf -q "$1" --height 40%)
  eval "cd $dir"
}

addff() {
  local dirs="$DOTFILES"/quick/dirs
  (cat $dirs; pwd) \
  | cat -n | sort -k2,2 -k1,1n | uniq -f1 | sort -k1,1n | cut -f2- \
  | tee $dirs > /dev/null
}
