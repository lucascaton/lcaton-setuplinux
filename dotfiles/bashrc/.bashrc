# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

#exibir o branch do git no terminal
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

#export PS1="\w`__git_ps1` $ "
#PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
#export PS1="\w$ "
export EDITOR="vim"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
local BLUE="\[\033[0;34m\]"
local RED="\[\033[0;31m\]"
local LIGHT_RED="\[\033[1;31m\]"
local GREEN="\[\033[0;32m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local WHITE="\[\033[1;37m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
local YELLOW="\[\033[1;33m\]"
case $TERM in
  xterm*)
  TITLEBAR='\[\033]0;\u@\h:\w\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
esac

PS1="${TITLEBAR}\
$BLUE\$(~/.rvm/bin/rvm-prompt)\
$YELLOW\u@\h:$LIGHT_GREEN\w$GREEN\$(parse_git_branch)\
$WHITE\$ "
PS2='> '
PS4='+ '
}
proml

#rvm
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

#git
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %Cblue%an%Creset - %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'

#rails
alias ss='script/server'
alias sc='script/console'
alias sdbc='script/dbconsole'
alias sg='script/generate'
alias sd='script/destroy'
alias rakedball='rake db:drop && rake db:create && rake db:schema:load && rake db:migrate && rake db:seed'
