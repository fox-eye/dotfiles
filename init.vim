" should be always first, use Vim settings instead of VI
set nocompatible

filetype plugin indent on
syntax on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " This line enables the true color support.

set number
set backspace=indent,eol,start "Allow backspace in insert mode
set history=200 "command history length
set ruler
set laststatus=2
set visualbell "no sounds
set autoread  "reload files changed outside of vim

" Vim plug - plugins - :PlugInstall to install 
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'rakr/vim-one'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'w0rp/ale'
Plug 'eugen0329/vim-esearch'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" Appearence

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=light " light or dark
colorscheme one

let g:airline_theme='one'

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

" Git
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

let NERDTreeWinSize = 50

" Deoplete
let g:deoplete#enable_at_startup = 1

" Ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '!'

" Python
let g:python3_host_prog = '/usr/bin/python'

" remaps
inoremap jk <ESC>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

nnoremap ag :Ag<CR>
nnoremap bf :Buffers<CR>
nnoremap <C-l> :BLines<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-h> :History<CR>

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
