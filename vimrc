" Load Pathogen
call pathogen#infect()

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
set t_Co=256
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid

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
hi LineNr ctermfg=grey

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Open a NERDTree automatically when vim starts up if no files were
autocmd vimenter * if !argc() | NERDTree | endif

" Reload vimrc on change (from http://superuser.com/a/417997)
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
