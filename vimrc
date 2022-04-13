set number	
set linebreak  
set showbreak=+
set textwidth=100	
set showmatch	
" set visualbell
set belloff=all
syntax on
" all the pretty colors
" blue.vim
" darkblue.vim
" default.vim
" delek.vim
" desert.vim
" elflord.vim
" evening.vim
" koehler.vim
" morning.vim
" murphy.vim
" pablo.vim
" peachpuff.vim
" ron.vim
" shine.vim
" slate.vim
" torte.vim
" zellner.vim
colorscheme delek

set hlsearch	
set smartcase	
set ignorecase	
set incsearch	
 
set autoindent	
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
set shiftwidth=2
set smartindent	
set smarttab  
set softtabstop=2	
 
set ruler     

set undolevels=1000   
set backspace=indent,eol,start
 
