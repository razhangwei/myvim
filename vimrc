" vundle initialization
" avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible
filetype off        " required! for Vundle

" setting up vundle - the vim plugin bundler
let icanhazvundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "installing vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let icanhazvundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
Bundle 'gmarik/vundle'

" ============================================================================
" Active plugins

" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
" Java Autocomplete
Bundle 'adragomir/javacomplete'
" syntastic: detect compiling errors while editing
Bundle 'scrooloose/syntastic'
" Better file browser
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" show function/variables
Bundle 'majutsushi/tagbar'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Git integration
Bundle 'tpope/vim-fugitive'
" a status bar that displays many info
Bundle 'klen/python-mode'
" compile most of files with one key
Bundle 'vim-scripts/SingleCompile'
" Sublime-Text like multi-cursor support
Bundle 'terryma/vim-multiple-cursors'
" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'

" ============================================================================
" Vim settings and mappings
let mapleader=","
let g:mapleader=","
imap <leader><leader> <esc>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" enable the cmd+c to do 'system-copy' in terminal-vim
vmap <C-c> "py
nmap <C-c> "pyiw
vmap <C-p> "pp
nmap <C-p> "pP
imap <C-p> <Esc>"ppa

" allow plugins by file type
filetype on         " Enable filetype detection
filetype plugin on  " Enable filetype-spefic indenting
filetype indent on  " Enable filetype-spefic plugins

" tabs and spaces handling
set tabstop=4
set shiftwidth=4	" allows you to use the < and > to block indent/unindent regions
set smarttab		" use shiftwidth setting for inserting <tab>s
set expandtab		" insert spaces instead of <Tab> when <tab> key is pressed
set softtabstop=4	" makes VIM see multiple space characters as tabstops
set autoindent      " the indent of the new line will match that of previous line
autocmd Filetype matlab setlocal ts=2 sts=2 sw=2
autocmd Filetype Makefile set noexpandtab

" always show a status line 
set ls=2
" auto read when file is changed from outside
set autoread  
" increamental search
set incsearch
" highlighted search results
set hlsearch
" syntax highlight on
syntax on
" show line numbers
set nu
" enable mouse scrolling
set mouse=a
" highlight current line
set cursorline      
" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set wildchar=<TAB>  
set wildmenu        " enable a menu at the bottom of the vim
set showmatch       " show the matched brace when typing
set showmode        " indicate input or replace mode at bottom 

" remember cursor's position of last time
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

"auto relaod vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc

" ============================================================================
" USEFUL SHORTCUTS
" ============================================================================
map <leader>a ggVG
nmap <leader>p <Esc>:set paste<CR>
nmap <leader>np <Esc>:set nopaste<CR>

" Bash like keys for the command line
cmap <C-A> <Home>
cmap <C-E> <End> cmap <C-K> <C-C>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ============================================================================
" ENCODING SETTINGS
" ============================================================================
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
  set encoding=utf-8                                  
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8                                  
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
  set encoding=big5
  set fileencoding=big5
endfun


" --- YCM(YouCompleteMe) & eclim---
" *** usage: use C-X C-X or C-<space> to trigger the completion ***
" the flowing line enable YCM to do powful C++ completion funtionality
" by loading cpp completion model
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" If you prefer the completion tip window to close when a selection is
" made, these followint lines close it on movement in insert mode or
" when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'html' : ['.'],
      \ }

"---Syntastic -----------
"
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous  setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" disable python checker since python-mode provides a better checking
let g:syntastic_ignore_files = ['\.py$']

"---ListToggle ----------
let g:lt_location_list_toggle_map = '<F2>'
let g:lt_quickfix_list_toggle_map = '<F3>'
let g:lt_height = 10

"---toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:NERDTreeWinSize = 25

"---Tagbar ----------------------------- 
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 0
let g:tagbar_width = 25

"---SingleCompile-----------------------
nmap <F9> :SCCompile<CR>
nmap <F10> :SCCompile<CR>

"---NerdCommenter-----------------------
vmap <C-_> <leader>cc
nmap <C-_> <leader>cc

"---fix the backspace failure problem

func Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc

inoremap <BS> <c-r>=Backspace()<CR>
