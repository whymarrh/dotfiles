" use vim settings, rather than vi
set nocompatible

set ruler
set number
set history=1024
set showmode

" syntax highlighting
syntax on
colorscheme jellybeans

set autoread
set hlsearch
set nobackup
set nowb
set noswapfile

" indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set nowrap
" allow arrow keys to wrap
set whichwrap=<,>,h,l,[,]

" filename tab completion
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*DS_Store*,*.class
set wildignore+=*.png,*.jpg,*.gif

" scrolling
set scrolloff=10
set sidescrolloff=10
set sidescroll=1
