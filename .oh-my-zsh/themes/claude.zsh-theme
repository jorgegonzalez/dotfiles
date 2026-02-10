# Claude oh-my-zsh theme
# Designed to complement the Claude iTerm2 color scheme

# Colors
local orange='%F{214}'
local coral='%F{209}'
local blue='%F{117}'
local cyan='%F{123}'
local green='%F{150}'
local purple='%F{183}'
local gray='%F{245}'
local white='%F{255}'
local red='%F{210}'
local reset='%f'

# Git status
ZSH_THEME_GIT_PROMPT_PREFIX="${gray}on ${coral}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${orange}✗${reset}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${green}✓${reset}"

# Git status details
ZSH_THEME_GIT_PROMPT_ADDED="${green}+${reset}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${orange}!${reset}"
ZSH_THEME_GIT_PROMPT_DELETED="${red}−${reset}"
ZSH_THEME_GIT_PROMPT_RENAMED="${purple}»${reset}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${red}═${reset}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${gray}?${reset}"

# Helper function for git status
function git_prompt_status() {
  local INDEX STATUS
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$STATUS${cyan}⚑${reset}"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$STATUS${purple}↑${reset}"
  fi
  if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
    STATUS="$STATUS${purple}↓${reset}"
  fi
  echo $STATUS
}

# Node version
function node_prompt_version() {
  if which node &> /dev/null; then
    local node_version=$(node -v 2>/dev/null)
    if [[ -n "$node_version" ]]; then
      echo " ${gray}via${reset} ${green}⬢ ${node_version}${reset}"
    fi
  fi
}

# Directory truncation
function prompt_dir() {
  echo "${blue}%2~${reset}"
}

# Main prompt
PROMPT='
${white}╭─${reset} $(prompt_dir) $(git_prompt_info)$(git_prompt_status)$(node_prompt_version)
${white}╰─${reset}${orange}❯${reset} '

# Right prompt (optional - shows time)
RPROMPT='${gray}%*${reset}'
