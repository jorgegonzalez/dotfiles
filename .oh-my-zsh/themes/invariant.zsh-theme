local ret_status="%(?:%{$fg_bold[black]%}❯❯❯ :%{$fg_bold[magenta]%}❯❯❯ )"
PROMPT='%{$fg_bold[blue]%}%~ $(git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
