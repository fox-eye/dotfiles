" should be always first, use Vim settings instead of VI
set nocompatible

filetype plugin indent on
syntax on

set number
set backspace=indent,eol,start "Allow backspace in insert mode
set history=200 "command history length
set ruler
set laststatus=2
set visualbell "no sounds
set autoread  "reload files changed outside of vim

" Pathogen config
execute pathogen#infect() 
call pathogen#helptags()

" Appearence
colorscheme onedark

" no swap
set nobackup
set nowritebackup
set noswapfile

" Indent
set autoindent
set smartindent
set smarttab
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
retab

" search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default

" Nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

let NERDTreeWinSize = 50

" remaps
inoremap jk <ESC>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" paste mode (for system paste)
set pastetoggle=<f5>

" case sensitivity
set smartcase

" Ack with the Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" grep and ctrlP with The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Avoid swp files to be written
set noswapfile

set runtimepath^=~/.vim/bundle/ctrlp.vim
