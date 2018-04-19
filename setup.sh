#!/bin/bash

set -e

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "  --all : Set sym links, install software, and install vim plugins"
    echo "  --links : Set sym links only"
    echo "  --sw : Install software only"
    echo "  --vim : Install vim plugins only"
    echo "  --update : Update tmux plugins, vim plugins, and recompile YouCompleteMe"
    exit 1
fi

LINKS="false"
SW="false"
VIM="false"
UPDATE="false"

if  [[ $1 = "--all" ]]; then
    echo "Option --all turned on"
    LINKS="true"
    SW="true"
    VIM="true"
    UPDATE="false" #don't update - we just installed
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

if  [[ $1 = "--update" ]]; then
    echo "Option --update turned on"
    UPDATE="true"
else
    echo "Option --update not used"
fi

# Get path to current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$LINKS" = "true" ]; then
    echo "Setting up sym links..."

    # Create sym links to config files:
    ln -sf "$DIR"/dot_files/my_grep ~/.my_grep
    ln -sf "$DIR"/dot_files/bash_aliases ~/.bash_aliases
    ln -sf "$DIR"/dot_files/gitignore ~/.gitignore
    ln -sf "$DIR"/dot_files/gitconfig ~/.gitconfig
    ln -sf "$DIR"/dot_files/tmux.conf ~/.tmux.conf
    ln -sf "$DIR"/dot_files/vimrc ~/.vimrc
    # ln -sf "$DIR"/dot_files/vimperatorrc ~/.vimperatorrc
    ln -sf "$DIR"/dot_files/inputrc ~/.inputrc
    ln -sf "$DIR"/dot_files/dircolors ~/.dircolors
    sudo ln -sf "$DIR"/dot_files/ta /etc/bash_completion.d/ta
    # mkdir ~/.mutt
    # ln -sf "$DIR"/dot_files/muttrc ~/.mutt/muttrc

    # create workspace dir (if it doesn't already exist)
    # mkdir ~/workspace
    # ln -sf "$DIR"/dot_files/ycm_extra_conf.py ~/workspace/.ycm_extra_conf.py

    # create link to dropbox vimwiki directory from default vimwiki location:
    ln -sf ~/Dropbox/_vimwiki ~/vimwiki
fi

if [ "$SW" = "true" ]; then
    echo "Installing necessary software..."

    # sudo apt-get update

    # check if vim installed.  If not, install it.
    if hash vim 2>/dev/null; then
        echo "vim already installed."
    else
        echo "vim not installed. Installing..."
        sudo apt-get install -y vim vim-gtk
    fi

    # check if xsel installed.  If not, install it.
    if hash xsel 2>/dev/null; then
        echo "xsel already installed."
    else
        echo "xsel not installed. Installing..."
        sudo apt-get install -y xsel
    fi

    # check if python installed.  If not, install it.
    if hash python 2>/dev/null; then
        echo "python already installed."
    else
        echo "python not installed. Installing..."
        sudo apt-get install -y python-dev libxml2-dev libxslt-dev
        sudo apt-get install -y python
    fi

    # Install clang-format v3.6:
    sudo apt-get install -y clang-format-3.6

    # check if cmake installed.  If not, install it.
    if hash cmake 2>/dev/null; then
        echo "cmake already installed."
    else
        echo "cmake not installed. Installing..."
        sudo apt-get install -y cmake
    fi

    # check if g++ installed.  If not, install it.
    if hash g++ 2>/dev/null; then
        echo "g++ already installed."
    else
        echo "g++ not installed. Installing..."
        sudo apt-get install -y g++
    fi

    # check if xz installed.  If not, install it.
    if hash xz 2>/dev/null; then
        echo "xz already installed."
    else
        echo "xz not installed. Installing..."
        sudo apt-get install -y xz-utils
    fi

    # check if ctags installed.  If not, install it.
    if hash ctags 2>/dev/null; then
        echo "ctags already installed."
    else
        echo "ctags not installed. Installing..."
        sudo apt-get install -y exuberant-ctags
    fi

    # check if ranger installed.  If not, install it.
    if hash ranger 2>/dev/null; then
        echo "ranger already installed."
    else
        echo "ranger not installed. Installing..."
        sudo apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
    fi

    # check if catdoc installed.  If not, install it.
    if hash catdoc 2>/dev/null; then
        echo "catdoc already installed."
    else
        echo "catdoc not installed. Installing..."
        sudo apt-get install -y catdoc
    fi

    # check if docx2txt installed.  If not, install it.
    if hash docx2txt 2>/dev/null; then
        echo "docx2txt already installed."
    else
        echo "docx2txt not installed. Installing..."
        sudo apt-get install -y docx2txt
    fi

    # check if mutt installed.  If not, install it.
    if hash mutt 2>/dev/null; then
        echo "mutt already installed."
    else
        echo "mutt not installed. Installing..."
        # apt-get install -y mutt

        # # create necessary directories
        # mkdir -p ~/.mutt/cache/headers
        # mkdir ~/.mutt/cache/bodies
        # touch ~/.mutt/certificates
    fi

    # clone and install tmux:
    echo "Installing tmux..."
    if [ ! -d "$DIR"/tmux ]; then
        git clone https://github.com/tmux/tmux
    fi
    cd tmux
    git checkout 2.6
    sudo apt-get install -y libevent-dev libncurses5-dev autotools-dev automake pkg-config
    sh autogen.sh
    ./configure && make
    sudo make install
    cd ..

    # clone tmux plugin manager:
    echo "Installing tmux plugins..."
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
    # install plugins:
    ~/.tmux/plugins/tpm/bin/install_plugins

    # clone facebook path picker:
    echo "Installing facebook pathpicker..."
    if [ ! -d "$DIR"/PathPicker ]; then
        git clone https://github.com/facebook/PathPicker.git
    fi
    # set path to install fpp:
    sudo ln -sf "$DIR"/PathPicker/fpp /usr/local/bin/fpp

    # clone silver searcher:
    echo "Installing silver searcher..."
    if [ ! -d "$DIR"/the_silver_searcher ]; then
        git clone https://github.com/ggreer/the_silver_searcher.git
    fi
    sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
    cd the_silver_searcher
    ./build.sh
    sudo make install
    cd ..
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
    echo '\n' | vim +PluginUpdate +qall

    # Install you complete me:
    echo "Installing YouCompleteMe..."
    cd "$DIR"/bundle/YouCompleteMe
    ./install.py --clang-completer
fi

if [ "$UPDATE" = "true" ]; then
    # update all vim plugins
    echo "Updating vim plugins..."
    echo '\n' | vim +PluginInstall +qall
    echo '\n' | vim +PluginUpdate +qall

    # recompile you complete me:
    echo "Recompiling YouCompleteMe..."
    cd "$DIR"/bundle/YouCompleteMe
    ./install.py --clang-completer

    # install plugins:
    ~/.tmux/plugins/tpm/bin/install_plugins
fi

echo "Setup complete!"
