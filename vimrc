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
" Sublime-like theme
Bundle 'wellsjo/wellsokai.vim'
" Git integration
Bundle 'tpope/vim-fugitive'
" compile most of files with one key
Bundle 'vim-scripts/SingleCompile'
" Sublime-Text like multi-cursor support
Bundle 'terryma/vim-multiple-cursors'
" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'
" automatic closingn of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'
" allow you to use <Tab> for all insert completion tasks.
Bundle 'ervandew/supertab'
" Snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

" ============================================================================
" Vim settings and mappings
let mapleader=","
let g:mapleader=","
imap <leader><leader> <esc>

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
" for searches
set incsearch       " incremental searches
set hlsearch        " highlight search result
set ignorecase      " ignore cases
" syntax highlight on
syntax on
" show line numbers
set nu
" enable mouse scrolling
set mouse=a
" highlight current line
set cursorline      
" make backspace work like most other apps
set backspace=2
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
    colorscheme wellsokai
else
    colorscheme wellsokai
endif

set sessionoptions+=resize,winpos

" colors for gvim
if has('gui_running')
    colorscheme wellsokai
    " set guifont=Monaco
    " set transparency=10
    " turn off MacVim's toolbar, scrollbars, etc.
    set guioptions=aAce 
    set lines=30
    set columns=110
endif

"auto relaod vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc

" automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h
" ============================================================================
" USEFUL SHORTCUTS
" ============================================================================
map <leader>a ggVG
nmap <leader>p <Esc>:set paste<CR>
nmap <leader>np <Esc>:set nopaste<CR>

" Bash like keys for the command line
cmap <C-A> <Home>
cmap <C-E> <End> cmap <C-K> <C-C>

" enable the cmd+c to do 'system-copy' in terminal-vim
vmap <C-c> "+y
nmap <C-c> "+y
vmap <C-v> "+p
nmap <C-v> "+p
imap <C-v> <Esc>"+pA

" Split Related 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Tab behaviors
nnoremap <S-Tab> <<             
inoremap <S-Tab> <C-d>           

" Under normal mode, let Ctrl+Enter to start a new line. 
" <NL> represents Ctrl-Enter
nmap <NL> i<CR>

" move a line upward/downward
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" Tab pages key binding
map gc :tabnew<CR>     
map gk :tabclose<CR>
map gn :tabn<CR>
map g1 :tabn 1<CR>
map g2 :tabn 2<CR>
map g3 :tabn 3<CR>
map g4 :tabn 4<CR>
map g5 :tabn 5<CR>
map g6 :tabn 6<CR>
map g7 :tabn 7<CR>
map g8 :tabn 8<CR>
map g9 :tabn 9<CR>

"  change directory to file being edited; after change, print the directory.
" nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" ===========================================================================
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
" make YCM compatible with UltiSnips(using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"---Syntastic -----------
"
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 0
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous  setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" choose pylint as the checker for python
let g:syntatic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = {'type' : '(D103)'}

"---ListToggle ----------
let g:lt_location_list_toggle_map = '<F2>'
let g:lt_quickfix_list_toggle_map = '<F3>'
let g:lt_height = 10

"--- NERDTree & NERDTreeTabs------------
map <F2> <Esc>:NERDTreeTabsToggle<CR>
map <F3> <Esc>:NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" disable that old “Press ? for help”.
let NERDTreeMinimalUI = 1
" looks nicer
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

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
vmap <C-_> <leader>c<space>
nmap <C-_> <leader>c<space>

"---UltiSnips---------------------------
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
" let :UltiSnipsEdit to split your window
let g:UltiSnipsEditSplit='vertical'



"---fix the backspace failure problem
"func Backspace()
"  if col('.') == 1
"    if line('.')  != 1
"      return  "\<ESC>kA\<Del>"
"    else
"      return ""
"    endif
"  else
"    return "\<Left>\<Del>"
"  endif
"endfunc
"
"inoremap <BS> <c-r>=Backspace()<CR>
