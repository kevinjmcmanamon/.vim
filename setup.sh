#!/bin/bash

# Create sym links to config files:
ln -s ~/.vim/.bash_aliases ~/.bash_aliases
ln -s ~/.vim/.gitignore ~/.gitignore
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
ln -s ~/.vim/.vimrc ~/.vimrc

# create workspace dir (if it doesn't already exist)
mkdir ~/workspace
ln -s ~/.vim/.ycm_extra_conf.py ~/workspace/.ycm_extra_conf.py

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

# Install vim vundle plugin manager:
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Now install all vim plugins
vim +PluginInstall +qall

# Install you complete me:
echo "Installing YouCompleteMe..."
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
