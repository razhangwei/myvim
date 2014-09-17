" vundle initialization
" avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" setting up vundle - the vim plugin bundler
let icanhazvundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/readme.md')
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

