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

if [ "$LINKS" = "true" ]; then
    echo "Setting up sym links..."

    # Create sym links to config files:
    ln -s ~/.vim/.bash_aliases ~/.bash_aliases
    ln -s ~/.vim/.gitignore ~/.gitignore
    ln -s ~/.vim/.tmux.conf ~/.tmux.conf
    ln -s ~/.vim/.vimrc ~/.vimrc

    # create workspace dir (if it doesn't already exist)
    mkdir ~/workspace
    ln -s ~/.vim/.ycm_extra_conf.py ~/workspace/.ycm_extra_conf.py
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
        apt-get install -y vim
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
fi

if [ "$VIM" = "true" ]; then
    echo "Installing vim plugins..."

    # Install vim vundle plugin manager:
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        echo "Installing Vundle..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
        echo "~/.vim/bundle/Vundle.vim already exists.  No need to clone."
    fi

    # Now install all vim plugins
    echo "Installing vim plugins..."
    echo '\n' | vim +PluginInstall +qall

    # Install you complete me:
    echo "Installing YouCompleteMe..."
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
fi

echo "Setup complete!"
