"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc


" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ggreer/the_silver_searcher'
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'jelera/vim-javascript-syntax'
Plug 'Rigellute/rigel'
Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'

" React Stuff

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Initialize plugin system
call plug#end()

inoremap jk <ESC>

"----------------------------------------------
" Vim specific configs
"----------------------------------------------
" Colorscheme
" enable 24bit true color
set termguicolors
" enable the theme
syntax enable
colorscheme rigel
 " Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Set wildmode
set wildmode=list:longest,full
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif     

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Change cursor to huge underline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2               " │
set expandtab                  " ┘

" Search using <Space> instead of < / >
map <space> /
" Show “invisible” characters
set lcs=tab:›\ ,trail:•,eol:¬,nbsp:.
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Ruler on steroids
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

set completeopt=longest,menuone,preview

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Switch between buffers
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>


" Prevent arrow keys on normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Move between buffers
nnoremap <C-D> :bnext<CR>
nnoremap <C-S> :bprev<CR>

"nmap <C-n> :NERDTreeToggle<CR>
"vmap ++ <plug>NERDCommenterToggle
"nmap ++ <plug>NERDCommenterToggle


"----------------------------------------------
" Plugin Configs
"----------------------------------------------
" Change mapleader
let mapleader=","

"----------------------------------------------
" Plugin: PluginDTree
"----------------------------------------------
nmap <leader>t :NERDTreeToggle<cr>
" Clear highlight search
map <leader>c :nohlsearch<cr>
" Close current buffer
map <leader>w :bd<cr>
" Show hidden files in NERDTree
let NERDTreeShowHidden=1

"----------------------------------------------
" Plugin: Open Ag
"----------------------------------------------
nnoremap <leader>a :Ag<space>
" silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr> 

"----------------------------------------------
" Plugin: Go Language Support
"----------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Mappings
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap gc <Plug>(go-coverage-toggle)
au FileType go nmap gt <Plug>(go-test)
au FileType go nmap gf <Plug>(go-test-func)
au FileType go nmap gr <Plug>(go-run)

"----------------------------------------------
" Plugin: Ale
"----------------------------------------------
let g:ale_linters = {
\   'go': ['gofmt', 'gopls', 'golint', 'go vet'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint']
\}
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }

let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
\     'linter_checking': 'left',
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\     'linter_ok': 'left',
\ }

let g:lightline.active = { 'right': [[ 'fileformat', 'fileencoding', 'percent', 'filetype', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
\                                         'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
\    }

let g:lightline.component_function = {
\     'gitbranch': 'fugitive#head',
\            'cocstatus': 'coc#status',
\            'currentfunction': 'CocCurrentFunction'
\ }
" End status line



let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Ale
let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'golint', 'go vet'],
\}

" Navigating through omni-completion
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
" Make `Tab` autocomplete.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Keep a menu item always highlighted
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Preventing `Enter` Key in creating new line
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
