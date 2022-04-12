set number  
set linebreak  
set showbreak=+
set textwidth=100 
set showmatch 
set visualbell  
syntax on
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

