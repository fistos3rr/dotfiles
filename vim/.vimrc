" disable compatibility with vi which can cause unexpected issues
set nocompatible
filetype on " enable filetype detection
filetype plugin on " enable plugins for detected filetype
filetype indent on " load an indent file for the filetype

syntax on " syntax highlighing

set number
set relativenumber " add numbers

set cursorline " highlight cursor line

colorscheme habamax " default colorscheme

set clipboard=unnamedplus " systemclipboard on linux
set mouse=a

" Tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" filetype specific tabs
autocmd FileType javascript,typescript,html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript,typescript,html setlocal expandtab

set scrolloff=10

set nobackup " no backup saving

set incsearch " searching
set ignorecase " ignore capital letters
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=100

set wildmenu " auto completion menu using TAB
set wildmode=list:longest " make wildmenu behave like similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.img,*.xlsx

" PLUGINS --------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

"    Plug 'dense-analysis/ale' " async lint engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree' " NERDTree 
    Plug 'powerman/vim-plugin-ruscmd' " russian language support in commands
    Plug 'jiangmiao/auto-pairs'
    Plug 'Vimjas/vim-python-pep8-indent'

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

" pyright
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"
inoremap <silent><expr> <CR> "\<C-g>u\<CR>"

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" STATUS LINE ----------------------------------------------------------------
set statusline=
set statusline+=\ %f\ %M\ %y\ %R " status line on left side
set statusline+=%= " use divider to separate the left side from the right side
" status line right side
set statusline+=\ (%l,%c)  
set laststatus=2 " show the status on the second to last line
