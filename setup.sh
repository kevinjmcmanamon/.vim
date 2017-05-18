#!/bin/bash

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "  --all : Set sym links, install software, and install vim plugins"
    echo "  --links : Set sym links only"
    echo "  --sw : Install software only"
    echo "  --vim : Install vim plugins only"
    exit 1
fi

LINKS="false"
SW="false"
VIM="false"

if  [[ $1 = "--all" ]]; then
    echo "Option --all turned on"
    LINKS="true"
    SW="true"
    VIM="true"
else
    echo "Option --all not used"
fi

if  [[ $1 = "--links" ]]; then
    echo "Option --links turned on"
    LINKS="true"
else
    echo "Option --links not used"
fi

if  [[ $1 = "--sw" ]]; then
    echo "Option --sw turned on"
    SW="true"
else
    echo "Option --sw not used"
fi

if  [[ $1 = "--vim" ]]; then
    echo "Option --vim turned on"
    VIM="true"
else
    echo "Option --vim not used"
fi

# Get path to current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$LINKS" = "true" ]; then
    echo "Setting up sym links..."

    # Create sym links to config files:
    ln -s "$DIR"/dot_files/bash_aliases ~/.bash_aliases
    ln -s "$DIR"/dot_files/gitignore ~/.gitignore
    ln -s "$DIR"/dot_files/gitconfig ~/.gitconfig
    ln -s "$DIR"/dot_files/tmux.conf ~/.tmux.conf
    ln -s "$DIR"/dot_files/vimrc ~/.vimrc
    ln -s "$DIR"/dot_files/inputrc ~/.inputrc
    ln -s "$DIR"/dot_files/dircolors ~/.dircolors

    # create workspace dir (if it doesn't already exist)
    mkdir ~/workspace
    ln -s "$DIR"/dot_files/ycm_extra_conf.py ~/workspace/.ycm_extra_conf.py
fi

if [ "$SW" = "true" ]; then
    echo "Installing necessary software..."

    # check if tmux installed.  If not, install it.
    if hash tmux 2>/dev/null; then
        echo "tmux already installed."
    else
        echo "tmux not installed. Installing..."
        apt-get update
        apt-get install -y tmux
    fi

    # check if vim installed.  If not, install it.
    if hash vim 2>/dev/null; then
        echo "vim already installed."
    else
        echo "vim not installed. Installing..."
        apt-get update
        apt-get install -y vim vim-gtk
    fi

    # check if python installed.  If not, install it.
    if hash python 2>/dev/null; then
        echo "python already installed."
    else
        echo "python not installed. Installing..."
        apt-get update
        apt-get install -y python-dev libxml2-dev libxslt-dev
        apt-get install -y python
    fi

    # check if cmake installed.  If not, install it.
    if hash cmake 2>/dev/null; then
        echo "cmake already installed."
    else
        echo "cmake not installed. Installing..."
        apt-get update
        apt-get install -y cmake
    fi

    # check if g++ installed.  If not, install it.
    if hash g++ 2>/dev/null; then
        echo "g++ already installed."
    else
        echo "g++ not installed. Installing..."
        apt-get update
        apt-get install -y g++
    fi

    # check if xz installed.  If not, install it.
    if hash xz 2>/dev/null; then
        echo "xz already installed."
    else
        echo "xz not installed. Installing..."
        apt-get update
        apt-get install -y xz-utils
    fi

    # check if ctags installed.  If not, install it.
    if hash ctags 2>/dev/null; then
        echo "ctags already installed."
    else
        echo "ctags not installed. Installing..."
        apt-get update
        apt-get install -y exuberant-ctags
    fi

    # check if ranger installed.  If not, install it.
    if hash ranger 2>/dev/null; then
        echo "ranger already installed."
    else
        echo "ranger not installed. Installing..."
        apt-get update
        apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
    fi

    # check if catdoc installed.  If not, install it.
    if hash catdoc 2>/dev/null; then
        echo "catdoc already installed."
    else
        echo "catdoc not installed. Installing..."
        apt-get update
        apt-get install -y catdoc
    fi

    # check if docx2txt installed.  If not, install it.
    if hash docx2txt 2>/dev/null; then
        echo "docx2txt already installed."
    else
        echo "docx2txt not installed. Installing..."
        apt-get update
        apt-get install -y docx2txt
    fi
fi

if [ "$VIM" = "true" ]; then
    echo "Installing vim plugins..."

    # Install vim vundle plugin manager:
    if [ ! -d "$DIR"/bundle/Vundle.vim ]; then
        echo "Installing Vundle..."
        git clone https://github.com/VundleVim/Vundle.vim.git "$DIR"/bundle/Vundle.vim
    else
        echo ""$DIR"/bundle/Vundle.vim already exists.  No need to clone."
    fi

    # Now install all vim plugins
    echo "Installing vim plugins..."
    echo '\n' | vim +PluginInstall +qall

    # Install you complete me:
    echo "Installing YouCompleteMe..."
    cd "$DIR"/bundle/YouCompleteMe
    ./install.py --clang-completer
fi

echo "Setup complete!"
