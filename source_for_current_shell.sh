#!/bin/bash

# TO BE COMPLETED AND TESTED!!!

# call using 'source' e.g. source ./script.sh

# get directory of current script:
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# set INPUTRC environment variable to point to correct .inputrc file
# (to be used by sub-shells and tmux)
export INPUTRC="$DIR"/.inputrc

# Reload .inputrc for current shell:
bind -f "$DIR"/.inputrc

# source correct .bash_aliases file to set all useful aliases
source "$DIR"/.bash_aliases

alias vim='vim -u "$DIR"/.vimrc'
alias tmux='tmux -2 -f "$DIR"/.tmux.conf' 

echo "done!"
