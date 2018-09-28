## Source bashrc
alias source-bash='source ~/.bashrc'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Resume wget by default
alias wget='wget -c'

# Restart network-manager
alias net-restart='sudo service network-manager restart'

# apt update and upgrade
alias a-update='sudo apt update'
alias a-upgrade='sudo apt upgrade'
alias a-install='sudo apt install'
