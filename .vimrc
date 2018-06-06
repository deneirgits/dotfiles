set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:indentLine_char='▏'
let g:indentLine_color_term = 239
filetype plugin on
filetype plugin indent on
let g:powerline_pycmd = 'py3'
set laststatus=2
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set showtabline=2
set mouse=a
set wildmenu
set lazyredraw
set incsearch hlsearch
set completeopt-=preview
set clipboard=unnamedplus
set ignorecase
set smartcase
let mapleader = ";"
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_min_num_of_chars_for_completion = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=50
nnoremap j gj
nnoremap k gk
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>b :bn<CR>
nnoremap <leader>v :bp<CR>
nnoremap <leader>q :bw<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :TagbarToggle<CR>
syntax on

" Close vim when only nerdtree is open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files in nerdtree
let NERDTreeShowHidden=1

" Open nerdtree always
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p

" Open nerdtree when no files are specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open nerdtree on right side
let g:NERDTreeWinPos = "right"

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" Bindings for clipboard functionalities
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Syntastic settings
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height=0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8']

" Tagbar settings
let g:tagbar_width=55
let g:tagbar_left=1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
