BLACK="\[\033[0;30m\]"
RED="\[\033[1;31m\]"
GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
WHITEBOLD="\[\033[1;37m\]"
__git_branch_color="$RED"

function short-prompt() {   
   local __cur_location="$BLUE\W"
   local __user="$GREEN\u"
   
   PS1="\[\e]2;\u:\w\a\]$__user${WHITE}:$__cur_location$__git_branch_color\$(git_prompt_info)${WHITE} \$ "
}

function long-prompt {
   local __cur_location="$BLUE\w"
   local __user_and_host="$GREEN\u@\h"
   
   export PS1="\[\e]2;\u@\h:\w\a\]$__user_and_host${WHITE}:$__cur_location$__git_branch_color\$(git_prompt_info)${WHITE} \$ "
}

export -f short-prompt
export -f long-prompt