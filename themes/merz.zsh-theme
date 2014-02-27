local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

eval my_gray='$FG[10]'
eval my_orange='$FG[214]'
eval my_lila='$FG[213]'

# left prompt
# %n   # username
# %m   # hostname
# %U%u # underline

PROMPT='%{$reset_color%}%m ${ret_status}%{$fg_bold[green]%}%p%{$fg[cyan]%}%c%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# right prompt
# RPROMPT='%{$my_gray%} $(emoji-clock)  %*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
