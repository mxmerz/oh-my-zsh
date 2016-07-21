# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '●'
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

local ruby_env=''
if which rvm-prompt &> /dev/null; then
  ruby_env=' ‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    ruby_env=' ‹$(rbenv version-name)›%{$reset_color%}'
  fi
fi

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

local default='%{$reset_color%}'
local fade='%{$FG[239]%}'
local my_grey='%{$fg_bold[grey]%}'
local my_orange='%{$FG[214]%}'
local my_lila='%{$FG[213]%}'
local my_green='%{$fg_bold[green]%}'
local my_yellow='%{$fg_bold[yellow]%}'
local my_blue='%{$fg_bold[blue]%}'


PROMPT="$fade$prompt_char $my_green%n$default $my_blue$(box_name)$default $my_yellow${current_dir}$default${git_info}
$my_grey➜$default "
#  %{$FG[239]%}using%{$FG[243]%}${ruby_env}

# right prompt
#RPROMPT='%{$my_gray%} $(emoji-clock)  %*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[202]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[040]%}✔"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
