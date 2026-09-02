" disable compatibility with vi which can cause unexpected issues
set nocompatible
filetype on " enable filetype detection
filetype plugin on " enable plugins for detected filetype
filetype indent on " load an indent file for the filetype
set autoindent

syntax on " syntax highlighing

set clipboard=unnamedplus " systemclipboard on linux
set mouse=a

set completeopt=menuone,noinsert,preview
set updatetime=300

" Когда меню видимо:
" <Tab>   – выбрать текущий вариант и вставить его (как <C-y>)
" <CR>    – закрыть меню без выбора и затем вставить новую строку
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <CR>  pumvisible() ? "\<C-e>\<CR>" : "\<CR>"
set complete=.,w,b,u,t,i

" Tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" filetype specific tabs
autocmd FileType javascript,typescript,html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript,typescript,html setlocal expandtab
autocmd FileType go setlocal noexpandtab    " Запрещаем замену табов на пробелы

set nobackup " no backup saving

set incsearch " searching
set ignorecase " ignore capital letters
set smartcase
set history=100

set wildmenu " auto completion menu using TAB
set wildmode=list:longest " make wildmenu behave like similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.img,*.xlsx

" VISUAL------------------------------------------------------------------
set cursorline " highlight cursor line
set number
set relativenumber " add numbers

" cursor
set guicursor=n-v-c:block-blinkon0,i:block-blinkwait200-blinkon200-blinkoff200

set nohlsearch
set showcmd
set showmode
set showmatch
set scrolloff=10
set nowrap
set listchars+=extends:›,precedes:‹
set sidescrolloff=10
set scrolloff=5

colorscheme koehler " default colorscheme
"colo: delek, koehler

" PLUGINS --------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
"    Plug 'dense-analysis/ale' " async lint engine
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree' " NERDTree 
    Plug 'jiangmiao/auto-pairs'
    Plug 'Vimjas/vim-python-pep8-indent'
	Plug 'vim-fuzzbox/fuzzbox.vim' " fuzzy search
call plug#end()

" MAPPINGS ------------------------------------------------------------------
let mapleader = "\<Space>"

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" clipboard 
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" STATUS LINE ----------------------------------------------------------------
set statusline=
set statusline+=\ %f\ %M\ %y\ %R " status line on left side
set statusline+=%= " use divider to separate the left side from the right side
" status line right side
set statusline+=\ (%l,%c)  
set laststatus=2 " show the status on the second to last line

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

nnoremap <M-,> :tabp<CR>
nnoremap <M-.> :tabn<CR>
nnoremap <M-c> :tabc<CR>
nnoremap <M-<> :tabmove -1<CR>
nnoremap <M->> :tabmove +1<CR>

" FUZZY FINDER------------------------------------------------------------------
nnoremap <silent> <leader>ff :FuzzyFiles<CR>
nnoremap <silent> <leader>fb :FuzzyBuffers<CR>
nnoremap <silent> <leader>fg :FuzzyGrep<CR>
nnoremap <silent> <leader>fs :FuzzyGitFiles<CR>

" COMMANDS------------------------------------------------------------------
command! SudoW :execute 'w !sudo tee % > /dev/null' | edit!
command! SudoWQ :execute 'w !sudo tee % > /dev/null' | edit! | q
