setopt prompt_subst

autoload -U colors && colors

function git_prompt_info() {
  local hash
  hash=$(git rev-parse --short=8 HEAD 2> /dev/null) || return 0

  local branch
  branch=$(git symbolic-ref --short HEAD 2> /dev/null)

  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${hash} ${branch:-DETACHED}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host="%B%(!.%{$fg[red]%}.%{$fg[green]%})%n@%M%{$reset_color%}%b "
local current_dir="%B%{$fg[blue]%}%~%{$reset_color%}%b "

local vcs_branch='$(git_prompt_info)'
local job_count='%(1j. %{$fg[magenta]%}%jj%{$reset_color%}.)'

PROMPT="${user_host}${current_dir}${vcs_branch}${job_count}
%B$%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}↕%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[magenta]%}✚%{$rset_color%}"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}✹%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[magenta]%}✖%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}═%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}✭%{$reset_color%}"
