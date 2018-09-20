# Source bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# For GIT Status
if [ ! -f ~/.bash_git ]
then
    echo "~/.bash_git does not exist. Downloading now."
    curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
    echo "Download complete."
fi
source ~/.bash_git

git_dirty() {
 git st 2>/dev/null | wc -l | awk '{if ($1 > 2) print "☠"}'
}

git_prompt_info() {
if [ "`type -t __git_ps1`" == 'function' ]; then
 export GIT_PS1_SHOWDIRTYSTATE=true     # '*' for unstaged changes, '+' for staged
 export GIT_PS1_SHOWSTASHSTATE=true     # '$' if smth is stashed
 export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files
fi
 branch_prompt=$(__git_ps1)
 if [ -n "$branch_prompt" ]; then
   status_icon=$(git_dirty)
   echo $branch_prompt $status_icon
 fi
}

# '*' for unstaged changes, '+' for staged
# '$' if smth is stashed
# '%' if un-tracked files
function prompt {
   local BLACK="\[\033[0;30m\]"
   local RED="\[\033[0;31m\]"
   local GREEN="\[\033[0;32m\]"
   local YELLOW="\[\033[0;33m\]"
   local BLUE="\[\033[0;34m\]"
   local PURPLE="\[\033[0;35m\]"
   local CYAN="\[\033[0;36m\]"
   local WHITE="\[\033[0;37m\]"
   local WHITEBOLD="\[\033[1;37m\]"
   local __cur_location="\[\033[01;33m\]\w"
   local __git_branch_color="\[\033[31m\]"
   local __user_and_host="\[\033[01;32m\]\u@\h"

   export PS1="$__user_and_host\$ $__cur_location $__git_branch_color\$(git_prompt_info)${WHITE} \$ "
}

prompt
