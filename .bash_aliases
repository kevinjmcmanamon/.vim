alias tmux='tmux -2'

# set default options for grep
alias grep='grep --color=auto --exclude-dir={build,devel,.svn,.git,.swp} --exclude=\*{.swp,.o}'
alias grepn='grep -n' # needed to add this separately as tab complete with 'make' was not working otherwise

# set an alias to easily open files using the default application from the terminal
alias o='xdg-open'

# set aliases for git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff --color-words'
alias go='git checkout'
alias gl='git lg'

# Set aliases for common directories that I want to cd in to:
alias ws='cd ~/workspace'
alias neptune='cd /media/kevin.mcmanamon/DATA/svn-general.seebyte.com/project/NEPTUNE'
alias fdeco='cd /media/kevin.mcmanamon/DATA/svn-general.seebyte.com/project/FDECO'
alias svngeneral='cd /media/kevin.mcmanamon/DATA/svn-general.seebyte.com'
alias data='cd /media/kevin.mcmanamon/DATA'
alias storage='cd /run/user/10110/gvfs/smb-share:server=storage,share=share'
alias kevin='cd /run/user/10110/gvfs/smb-share:server=storage,share=kevin.mcmanamon'
alias allhomes='cd /run/user/10110/gvfs/smb-share:server=storage,share=all-homes'

# provide alias to give cat functionality but with colour syntax highlighting

# create bash function to also display the file line numbers:
pyg() {
    pygmentize $1 | perl -e 'print ++$i." $_" for <>'
}

# create alias 'dog'
alias dog='pyg'

# alias for quick list of files in current dif
alias l='ls -lh'
alias la='ls -lha'

# nice shortcut to make navigating up directories more efficient:

# To cd up to n dirs: cd.. n
#   e.g. cd.. 5
#   will go up 5 directories
# Or cd to a dir on the current path using its name:
#   e.g. if pwd = /one/two/three/four
#   then 'cd.. two' will move to dir 'two'
#   furthermore, 'cd.. on' is all that is needed to move to dir 'one'
function cd_up() {
  case $1 in
    *[!0-9]*)                                          # if no a number
      cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )     # search dir_name in current path, if found - cd to it
      ;;                                               # if not found - not cd
    *)
      cd $(printf "%0.0s../" $(seq 1 $1));             # cd ../../../../  (N dirs)
    ;;
  esac
}
alias 'cd..'='cd_up'                                # can not name function 'cd..'

# disable XON/XOFF so that ctrl-S works for forward bash history searching
stty -ixon

# Set PS1 to make prompt look like cygwin
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\] $(__git_ps1 "(%s)")\n\$ '

