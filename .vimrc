set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"   Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"   Plugin 'L9'
" Git plugin not hosted on GitHub
"   Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"   Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"   Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" This option forces Vim to source .vimrc file if it present in working 
" directory, thus providing a place to store project-specific configuration.

" Since Vim will source .vimrc from any directory you run Vim from, this is a 
" potential security hole; so, you should consider setting secure option. 
" This option will restrict usage of some commands in non-default .vimrc files; 
" commands that write to file or execute shell commands are not allowed and map 
" commands are displayed.
set exrc
set secure

" Highlight all search pattern matches
set hlsearch

" Ignore case when searching for patterns
set ignorecase

" Launch NERDtree automatically
autocmd vimenter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p

" Show line at specified column (e.g. column 80)
set colorcolumn=80
highlight ColorColumn ctermbg=7 guibg=lightgrey

" Show line numbers by default
set number

" Use relative line numbering
set rnu

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/devel/*,*/build/*,*/.git/*,*.so

" map toggling of tagbar to F9
map <silent> <F9> :TagbarToggle<CR>

" map toggling of NERDTree to F8
map <silent> <F8> :NERDTreeToggle<CR>

" Settings for solarized (colourscheme)
syntax enable
" the term and t_ut options help vim work better inside tmux
set term=xterm-256color
set t_ut=
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Turn on rainbow parenthese by default
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Turn on spell checker by default
set spell

" add command to insert a new line without going into insert mode
nmap <CR> o<Esc>

