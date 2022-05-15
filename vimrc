set number	
set linebreak  
set showbreak=+
set textwidth=60	
set showmatch	
" visual bell flashes the screen
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
colorscheme elflord

" stop newlines after comments from automatically being commented
set formatoptions-=cro

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

set noswapfile

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Commenting blocks of code.
" https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
" type ,cc to comment a line and ,cu to uncomment a line (works both in normal and visual mode).
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

