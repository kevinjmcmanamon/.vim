alias tmux='tmux -2'

# set default options for grep
export GREP_OPTIONS='--color=auto --exclude-dir=build --exclude-dir=devel --exclude-dir=.svn --exclude-dir=.git --exclude-dir=.swp'

# provide alias to give cat functionality but with colour syntax highlighting

# create bash function to also display the file line numbers:
pyg() {
    pygmentize $1 | perl -e 'print ++$i." $_" for <>'
}

# create alias 'dog'
alias dog='pyg'
