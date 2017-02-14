" NOTES:
"
" TABS:
" :retab converts all existing tabs into spaces
"
" PASTE IN COMMAND MODE:
" Use CTRL-R " when entering a command in command mode to paste the current
" paste buffer contents. Substitute:
"   " for a buffer name,
"   % for current filename,
"   / for last search term,
"   + for the X clipboard or a host of other substitutions.
" CTRL-R also works in insert mode
"
" RECORDING KEY STROKES FOR REPEAT JOBS:
" (This is most useful for repeated jobs which cannot easily be done with ".")
"
" To start recording, press q in normal mode followed by a letter (a to z).
" That starts recording keystrokes to the specified register. Vim displays
" recording in the status line. Type any normal mode commands, or enter insert
" mode and type text. To stop recording, again press q while in normal mode.
"
" To playback your keystrokes, press @ followed by the letter previously
" chosen. Typing @@ repeats the last playback.
"
" GREP SEARCH:
" Example grep search:
" :grep! -Ri --include \*.cpp --include \*.h "velocity.linear" .
" Then call :copen (or F5 using the shortcut defined below) to view results in
" the quickfix view
" [Note that the exclamation mark after 'grep' (i.e. :grep!) means that the
" first match found will NOT be automatically opened in a buffer]
"
" COMMENTS:
" gcc comments the current line
" gc<motion> comments the motion
"
" SESSIONS:
" :mksession ~/mysession.vim
"
" Then later you can source that vim file and you'll have your old session
" back:
"
" :source ~/mysession.vim
"
" or open vim with the -S option:
"
" $ vim -S ~/mysession.vim
"
" TURN OFF AUTO INDENT WHEN PASTING INTO VIM:
"
" To turn off autoindent when you paste code, there's a special "paste" mode. Type:
"
" :set paste
"
" Then paste your code. Note that the text in the tooltip now says -- INSERT (paste) --.
" After you pasted your code, turn off the paste-mode, so that auto-indenting when you type works correctly again.
"
" :set nopaste
"
" LISTING AND SWITCHING BUFFERS:
"
" (Note that the F6 shortcut defined below can also be used)
" To list all open buffers:
"
" :ls
"
" Then to switch to a specific buffer:
"
" :bu
"
" followed by the name or number of the buffer
"
" CHANGING TEXT CASE:
"
" You can change the case of text:
"
"     Toggle case "HellO" to "hELLo" with g~ then a movement.
"     Uppercase "HellO" to "HELLO" with gU then a movement.
"     Lowercase "HellO" to "hello" with gu then a movement.
"
" Alternatively, you can visually select text then press ~ to toggle case, or U
" to convert to uppercase, or u to convert to lowercase.
"
" CHANGING SURROUNDINGS:
"
" With vim-surround plugin.
" ds" (delete surrounding) will delete the surrounding double-quotes.
" cs)' (change surrounding) will change surrounding () to single-quotes.
" ys<motion>] (you surround) will surround the given motion with [].
" yss> (you surround single line) will surround the current line with <>.
" In visual mode, an S with an argument wraps the selection.
"
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
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'henrik/vim-indexed-search'
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'

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
"
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


" -----------------------------------------------------------------------------
" GENERAL VIM SETTINGS
" -----------------------------------------------------------------------------

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

" Show line at specified column (e.g. column 80)
set colorcolumn=80
highlight ColorColumn ctermbg=7 guibg=lightgrey

" Show line numbers by default
set number

" Use relative line numbering
set rnu

" nice way to close the current buffer
nnoremap <C-c> :bp\|bd #<CR>

" set up TAB settings
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" remap keys to easily switch between buffers
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-l> :bn<CR>

" remap Y to copy from cursor to end of the line (similar to 'C' and 'D')
nnoremap <silent> <S-y> y$

" Turn on spell checker by default
set spell

" show all tabs as >----
set list
set listchars=tab:>-

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

" Under default settings, making changes and then opening a new file will display
"     E37: No write since last change (add ! to override)
" Typing :set hidden will change this behaviour
" With :set hidden, opening a new file when the current buffer has unsaved changes
" causes files to be hidden instead of closed. Also helps to preserve undo
" history within a buffer.
set hidden

" To use ctrl-^ to toggle "caps lock" in vim (rather than using system caps).
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" (http://vim.wikia.com/wiki/Insert-mode_only_Caps_Lock)
for c in range(char2nr('A'), char2nr('Z'))
    execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
    execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" map toggling of quickfix view to F5
map <silent> <F5> :copen<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <F5> :ccl<CR>

" map shift-h and shift-l to move to previous older and newer quickfix views.
autocmd BufReadPost quickfix nnoremap <buffer> <S-h> :col<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <S-l> :cnew<CR>

" In quickfix view, allow same shortcuts as in NERDTree to open and preview
" files in the main window or in splits:
" o: open
" go: preview
" i: open split
" gi: preview split
" s: open vsplit
" gs: preview vsplit
autocmd BufReadPost quickfix nnoremap <buffer> o <CR>
autocmd BufReadPost quickfix nnoremap <buffer> go <CR><bar>:copen<CR>

autocmd BufReadPost quickfix nnoremap <buffer> i <CR><C-W>S<bar>:b#<cr><bar><C-W>j
autocmd BufReadPost quickfix nnoremap <buffer> gi <CR><C-W>S<bar>:b#<cr><bar>:copen<CR>

autocmd BufReadPost quickfix nnoremap <buffer> s <CR><bar>:vsplit<CR><bar>:b#<cr><bar><C-W>l
autocmd BufReadPost quickfix nnoremap <buffer> gs <CR><bar>:vsplit<CR><bar>:b#<cr><bar>:copen<CR>

" When F6 is pressed, a numbered list of buffer names is printed, and the user
" needs to type a single number based on the "menu" and press enter to switch
" to that buffer
:nnoremap <F6> :buffers<CR>:buffer<Space>

" Add shortcut "ctrl-j" to change the current word with the current yanked text
:map <C-j> cw<C-r>0<ESC>

" Add shortcut to quickly clear search highlighting by pressing Return, without
" turning off search highlighting for subsequent searches
nnoremap <CR> :noh<CR><CR>

" Added shortcuts to quickly size vim windows
nnoremap <C-E>j <C-W>5+
nnoremap <C-E>k <C-W>5-
nnoremap <C-E>h <C-W>5<
nnoremap <C-E>l <C-W>5>

" added shortcut to insert new lines above and below current line without
" leaving normal mode
nmap oo o<Esc>
nmap OO O<Esc>

" -----------------------------------------------------------------------------
" CTRL-P
" -----------------------------------------------------------------------------

set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/devel/*,*/build/*,*/.git/*,*.so

" w - begin finding a root from the current working directory outside of CtrlP
"     instead of from the directory of the current file (default). Only applies
"     when "r" is also present.
let g:ctrlp_working_path_mode = 'rw'

" -----------------------------------------------------------------------------
" TAGBAR
" -----------------------------------------------------------------------------

" map toggling of tagbar to F9
map <silent> <F9> :TagbarToggle<CR>

" prevent tagbar from moving to another buffer from its window
autocmd FileType tagbar noremap <buffer> <C-h> <nop>
autocmd FileType tagbar noremap <buffer> <C-l> <nop>

" -----------------------------------------------------------------------------
" NERDTree
" -----------------------------------------------------------------------------

" Launch NERDtree automatically
autocmd vimenter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p

" map toggling of NERDTree to F8
map <silent> <F8> :NERDTreeToggle<CR>

" map finding of file in NERDTree to F7
map <silent> <F7> :NERDTreeFind<CR>

" prevent nerdtree from moving to another buffer from its window
autocmd FileType nerdtree noremap <buffer> <C-h> <nop>
autocmd FileType nerdtree noremap <buffer> <C-l> <nop>

" Set vim's current working directory based on the current NERDTree working
" directory
let g:NERDTreeChDirMode = 2

" -----------------------------------------------------------------------------
" SOLARIZED
" -----------------------------------------------------------------------------

" Settings for solarized (colourscheme)
syntax enable

" the term and t_ut options help vim work better inside tmux
set term=xterm-256color
set t_ut=
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" -----------------------------------------------------------------------------
" RAINBOW PARENTHESES
" -----------------------------------------------------------------------------

" Turn on rainbow parentheses by default
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" -----------------------------------------------------------------------------
" VIM AIRLINE
" -----------------------------------------------------------------------------

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1

" -----------------------------------------------------------------------------
" EASY MOTION
" -----------------------------------------------------------------------------

" Easymotion shortcut
nmap f <Plug>(easymotion-bd-w)

" -----------------------------------------------------------------------------
" YOU COMPLETE ME
" -----------------------------------------------------------------------------

" YouCompleteMe mappings
nnoremap <F2> :YcmCompleter GoToDeclaration<CR>
nnoremap <F3> :YcmCompleter GoTo<CR>
nnoremap <F4> :YcmCompleter GetDoc<CR>

" When this option is set to 1, YCM will auto-close the preview window after
" the user leaves insert mode.
let g:ycm_autoclose_preview_window_after_insertion = 1

" -----------------------------------------------------------------------------
" SYNTASTIC
" -----------------------------------------------------------------------------

" The default settings recommended by vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -----------------------------------------------------------------------------
" VIM OPERATOR FLASHY
" -----------------------------------------------------------------------------

" Flash yanked text
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" set flash time to 300ms
let g:operator#flashy#flash_time = 300
