" Settings
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set backspace=2   " Let backspace kill newlines
set cursorline
set encoding=utf-8

" Vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if filereadable(expand("~/.vimrc.bundles"))
  call vundle#begin()
  source ~/.vimrc.bundles
  call vundle#end()
endif
filetype plugin indent on

" Searches
set hlsearch             " highlight search results
set incsearch            " search whilst typing
set ignorecase           " case insensitive searching
set smartcase            " override ignorecase if upper case typed

" Line wrapping
set wrap
set linebreak
set nolist        " list disables linebreak
set textwidth=0
set wrapmargin=0
set tw=70

" Colorscheme stuff
syntax on
set term=screen-256color
let base16colorspace=256
set t_Co=256
set background=dark
let base16colorspace=256        " Access colors present in 256 colorspace
colorscheme base16-ocean
set nofoldenable                " disable code folding

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
 
" Display extra whitespace
set list listchars=tab:»·,trail:·

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Numbers
set number
set numberwidth=5
"hi LineNr ctermfg=white

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Get off my lawn
let mapleader = ','
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Open a NERDTree automatically when vim starts up if no files were
autocmd vimenter * if !argc() | NERDTree | endif

" Reload vimrc on change (from http://superuser.com/a/417997)
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" NERDTree ignore
let NERDTreeIgnore = ['\.pyc$']

" Litcoffee support
autocmd FileType litcoffee runtime ftplugin/coffee.vim
