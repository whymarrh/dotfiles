" Use vim settings, rather than vi
set nocompatible

" Disable viminfo
set viminfo=""

set ruler
set number
set history=1024
set showmode

" Syntax highlighting
syntax on
colorscheme jellybeans

set autoread
set hlsearch
set nobackup
set nowb
set noswapfile

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" File encoding
set fileencodings=utf-8

set nowrap
" Allow arrow keys to wrap
set whichwrap=<,>,h,l,[,]

" Filename tab completion
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*.pyo,*.pyc
set wildignore+=*DS_Store*,*.class
set wildignore+=*.png,*.jpg,*.gif

" Scrolling
set scrolloff=10
set sidescrolloff=10
set sidescroll=1
