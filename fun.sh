
bak() {
  cp -ri "$1"{,.bak}
}

open() {
  # open_command https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh
  local p=${1:-.}
  command open "$p"
}

mkcd() {
  mkdir -p "$@" && cd "$@"
}

stext() {
  if [[ $# -eq 1 ]]; then
    grep -irn "$1" . \
      --exclude-dir={.git,node_modules}
  else
    grep -in "$@" \
      --exclude-dir={.git,node_modules}
  fi
}

sfile() {
  find . -iname "$@"
}

sdir() {
  find . -type d -iname "$@"
}

scmd() {
  if $(type "$1" | grep -q 'is a shell function'); then
    type "$1"
    which "$1"
  elif $(type "$1" | grep -q 'is an alias'); then
    PS4='+%x:%I>' zsh -i -x -c '' |& grep '>alias ' | grep "${1}="
  fi
}

dudir() {
  local depth=${1:-1}
  du -hd "$depth"
}

pbsort() {
  clippaste | sort | clipcopy
}

pbuniq() {
  clippaste | cat -n | sort -k2,2 -k1,1n | uniq -f1 | sort -k1,1n | cut -f2- | clipcopy
}

pyserver() {
  # python2 -m SimpleHTTPServer "$@"
  python3 -m http.server "$@"
}

checkport() {
  lsof -nP -iTCP:"$1"
}

sip() {
  # https://stackoverflow.com/questions/3097589/getting-my-public-ip-via-api
  # curl ipinfo.io "$@"
  curl ifconfig.me "$@"
}

