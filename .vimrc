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
" syntastic: detect compiling errors while editing
Bundle 'scrooloose/syntastic'
" Better file browser
Bundle 'scrooloose/nerdtree'
" show function/variables
Bundle 'majutsushi/tagbar'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'


" ============================================================================
" Vim settings and mappings

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

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

"---Tagbar ----------------------------- 
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 0
