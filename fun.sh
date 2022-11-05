j() {
  if [[ $# -eq 0 ]]; then
    _zlua -I .
  else
    _zlua -I "$@"
  fi
}

sip() {
  curl https://api.ipify.org $@
}

