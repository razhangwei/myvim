" vundle initialization
" avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

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

filetype off

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
" automatic closing of quotes, parenthesis, brackets, etc.
"Bundle 'Raimondi/delimitMate'
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

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set tabstop=4
set shiftwidth=4	" allows you to use the < and > to block indent/unindent regions
set smarttab		" use shiftwidth setting for inserting <tab>s
set expandtab		" insert spaces instead of <Tab> when <tab> key is pressed
set softtabstop=4	" makes VIM see multiple space characters as tabstops
autocmd Filetype matlab setlocal ts=2 sts=2 sw=2

" always show status bar
set ls=2
set autoread            " auto read when file is changed from outside
" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" enable mouse scrolling
set mouse=a

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

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1


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
" The following is for eclim, This will make YCM and Eclim play nice; YCM will
" use Eclim's omnifuncs as the data source for semantic completions and
" provide the auto-triggering and subsequence-based matching (and other YCM
" features) on top of it.
let g:EclimCompletionMethod = 'omnifunc'

let g:clang_user_options='|| exit 0'
" Syntastic ------------------------------
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

"---ListToggle ----------
"let g:lt_location_list_toggle_map = '<F2>'
"let g:lt_quickfix_list_toggle_map = '<F3>'
"let g:lt_height = 10

"---toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
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
