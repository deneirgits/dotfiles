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
Plugin 'pangloss/vim-javascript'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'mxw/vim-jsx'
Plugin 'epilande/vim-react-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'alvan/vim-closetag'
Plugin 'prettier/vim-prettier'
Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'numirias/semshi'
Plugin 'tell-k/vim-autopep8'
Plugin 'airblade/vim-gitgutter'
Plugin 'qpkorr/vim-bufkill'
Plugin 'junegunn/fzf.vim'
" Plugin 'majutsushi/tagbar'
Plugin 'liuchengxu/vista.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

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
filetype plugin on
filetype plugin indent on
set laststatus=2
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set showtabline=2
set mouse=a
set wildmenu
set lazyredraw
set incsearch hlsearch
set completeopt-=preview
set clipboard+=unnamedplus
set ignorecase
set smartcase
set so=999 " set cursor vertically center
set nofoldenable
set noshowmode
set updatetime=100
set conceallevel=2
let mapleader = ";"
let g:python3_host_prog = '/usr/bin/python'
nnoremap j gj
nnoremap k gk
nnoremap / :BLines<CR>
nnoremap <silent><leader><space> :nohlsearch<CR>
nnoremap <silent><leader>b :tabn<CR>
nnoremap <silent><leader>v :tabp<CR>
nnoremap <silent><leader>q :BW<CR>
nnoremap <silent><leader>w :bw<CR>
nnoremap <silent><leader>o :NERDTreeToggle<CR>
nnoremap <silent><leader>n :FZF<CR>
nnoremap <silent><leader>m :Windows<CR>
syntax on

" Bindings for clipboard functionalities
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" IndentLine settings
let g:indentLine_char='▏'
let g:indentLine_color_term = 239
let g:vim_json_syntax_conceal = 0
let g:indentLine_fileTypeExclude = ['markdown', 'md']

" NERDTree settings
" Close vim when only nerdtree is open
nnoremap <silent><leader>o :NERDTreeToggle<CR>
nnoremap <silent><leader>f :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=90

" YouCompleteMe settings
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_min_num_of_chars_for_completion = 1
nnoremap <silent><leader>g :tab split \| YcmCompleter GoToDefinition<CR>

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'flake8', 'pyflakes']

" React snippets settings
let g:UltiSnipsExpandTrigger="<C-l>"

" Prettier settings
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 4
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Closetag settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'
let g:closetag_emptyTags_caseSensitive = 0
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_theme='luna'

" Semshi settings
let g:semshi#active = 'true'
let g:semshi#mark_selected_nodes = 0
let g:semshi#simplify_markup = v:true

augroup ps_semshi
    au!
    au! FileType python call PythonSemshiHl()
augroup END

function PythonSemshiHl()
    " If these are defined within our colorschem they will be overriden so
    " define them here instead
    hi semshiImported        guifg=#e06c75 gui=NONE
    hi semshiParameter       guifg=#d19a66
    hi semshiParameterUnused guifg=#d19a66 gui=underline
    hi semshiBuiltin         guifg=#e5c07b
    hi semshiSelf            guifg=#e06c75
    hi semshiAttribute       guifg=#abb2bf
    hi semshiLocal           guifg=#56b6c2
    hi semshiFree            guifg=#be5046
    hi semshiGlobal          guifg=#528bff
    hi semshiUnresolved      guifg=#abb2bf gui=NONE
    " Python default (defined here to override semshi's)
    hi pythonKeyword         guifg=#98c379
endfunction

" Autopep8 settings
let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 1

" FZF settings
nnoremap <silent><leader>n :FZF<CR>
nnoremap <silent><leader>m :Windows<CR>
function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction

command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

let g:fzf_action = {
  \ 'enter': 'GotoOrOpen tab',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'right': '90' }

" Tagbar settings
" nnoremap <silent><leader>j :TagbarToggle<CR>
" let g:tagbar_width = 90
" let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
" let g:tagbar_sort = 0

" Vista settings
" autoclose Vista if only buffer left
autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | execute "normal! :q!\<CR>" | endif
nnoremap <silent><leader>j :Vista!!<CR>
let g:vista_default_executive = 'ctags'
let g:vista_sidebar_width = 90
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]
let g:vista_stay_on_open = 0

" Vim-markdown settings
let g:vim_markdown_conceal = 1
let g:vim_markdown_strikethrough = 1
