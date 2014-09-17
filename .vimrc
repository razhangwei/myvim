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


