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
"
filetype plugin indent on
let g:powerline_pycmd = 'py3'
set laststatus=2
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set showtabline=2
" set cursorline
set wildmenu
set lazyredraw
set incsearch hlsearch
set completeopt-=preview
let mapleader = ";"
let g:ycm_server_python_interpreter = '/usr/bin/python3'
nnoremap j gj
nnoremap k gk
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>b :bn<CR>
nnoremap <leader>v :bp<CR>
syntax on
