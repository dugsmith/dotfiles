alias rspec='rspec --color '
# From https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
# http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# put current git branch in the prompt
#
function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
 local        BLUE="\[\033[0;34m\]"
 local         RED="\[\033[0;31m\]"
 local   LIGHT_RED="\[\033[1;31m\]"
 local       GREEN="\[\033[0;32m\]"
 local LIGHT_GREEN="\[\033[1;32m\]"
 local       WHITE="\[\033[1;37m\]"
 local  LIGHT_GRAY="\[\033[0;37m\]"
 case $TERM in
   xterm*)
   TITLEBAR='\[\033]0;\u@\h:\w\007\]'
   ;;
   *)
   TITLEBAR=""
   ;;
 esac

PS1="${TITLEBAR}\
$BLUE[$WHITE\$(date +%H:%M)$BLUE]\
$BLUE[$WHITE\u@localhost:\W$GREEN\$(parse_git_branch)$BLUE]\
$LIGHT_GRAY\$ "
PS2='> '
PS4='+ '
}
proml
set -o vi

### rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

