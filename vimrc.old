set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" ncm2 and related plugins
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-syntax'
Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude'
Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-jedi'

" ale and related plugins
Plug 'dense-analysis/ale'

" nerdtree and related plugins
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" airline plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'roxma/nvim-yarp'
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'numirias/semshi'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'plasticboy/vim-markdown'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'

" LanguageServer client
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" Put your non-Plug stuff after this line
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
set smartindent
set so=999 " set cursor vertically center
set nofoldenable
set noshowmode
set updatetime=100
set conceallevel=2
set termguicolors " set 24-bit colors
let mapleader = " "
let g:python3_host_prog = '/usr/bin/python3.6'
nnoremap j gj
nnoremap k gk
nnoremap / :BLines<CR>
nnoremap <silent><leader><space> :nohlsearch<CR>:Semshi enable<CR>
nnoremap <silent><nowait><leader>t gt
nnoremap <silent><nowait><leader>T gT
nnoremap <silent><leader>q :bw<CR>
" Go to definition
nmap <silent><leader>gd :execute 'tab tag '.expand('<cword>')<CR>
syntax on

" Bindings for clipboard functionalities
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" NCM settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ale settings
"nnoremap <silent><leader>gd :tab split \| ALEGoToDefinition<CR>
nnoremap <silent><leader>fr :ALEFindReference<CR>
nmap <silent><leader>e <Plug>(ale_previous_wrap)
nmap <silent><leader>E <Plug>(ale_next_wrap)
" Toggle ale_fixers
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['isort', 'autopep8']}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" IndentLine settings
let g:indentLine_char='▏'
let g:indentLine_color_term = 239
let g:vim_json_syntax_conceal = 0
let g:indentLine_fileTypeExclude = ['markdown', 'md']

" NERDTree settings
nnoremap <silent><leader>fd :NERDTreeToggle<CR>
nnoremap <silent><leader>ff :NERDTreeFind<CR>
" Close vim when only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=90
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeLimitedSyntax = 1

" Closetag settings
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'
let g:closetag_emptyTags_caseSensitive = 0
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='onedark'

" Semshi settings
let g:semshi#active = 'true'
let g:semshi#mark_selected_nodes = 2

" FZF settings
let $FZF_DEFAULT_COMMAND = "fd --type f --full-path --color auto"
nnoremap <silent><leader>o :Files<CR>
nnoremap <silent><leader>O :Windows<CR>
nnoremap <silent><leader>// :Rg<CR>
function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction


function! s:blines_at_bottom(arg, bang)
    let tokens  = split(a:arg)
    let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
    call fzf#vim#buffer_lines(query, a:bang ? {} : {'window': 'belowright 25split enew'})
endfunction

autocmd VimEnter * command! -nargs=* -bang BLines call s:blines_at_bottom(<q-args>, <bang>0)
command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

let g:fzf_action = {
  \ 'enter': 'GotoOrOpen tab',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
let g:fzf_layout = {'down': '45%'}

" Vista settings
autocmd BufWinEnter *.py,*.js,*.html,*.json,*.css,*.yml,*.sh,*.pip Vista!!
" autoclose Vista if only buffer left
autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif
nnoremap <silent><leader>j :Vista!!<CR>
let g:vista_default_executive = 'ctags'
let g:vista_sidebar_width = 70
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]
let g:vista_stay_on_open = 0
let g:vista_sidebar_position = 'vertical top'

" Vim-markdown settings
let g:vim_markdown_conceal = 1
let g:vim_markdown_strikethrough = 1

" Prettier settings
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0

" GitGutter settings
let g:gitgutter_preview_win_floating = 0
" Close hunk preview if cursor moved to unchanged line
au CursorMoved * if !gitgutter#hunk#in_hunk(line(".")) | pclose | endif

" Git blamer settings
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
"let g:blamer_date_format = '%d/%m/%y'

" Fugitive settings
nmap <silent><leader>gst :tab G<CR>
autocmd FileType fugitive nmap <buffer> g<Space> :Git 
autocmd FileType fugitive nmap <buffer> gp<Space> :Git push 
autocmd FileType fugitive nmap <buffer> gl<Space> :Git pull origin 
autocmd FileType fugitive nmap <buffer> cm<Space> :Git commit -m "
autocmd FileType fugitive nmap <buffer> <leader>gl :Git log<CR>

" Startify settings
nnoremap <silent><leader>st :tabnew <bar> Startify<CR>
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [{'c': '~/git-repos/SCOPE-webapp/scope/foodnet/settings/dev.py'}, {'g': '~/git-repos/SCOPE-webapp/.git/index'}]

" Onedark settings
colorscheme onedark
