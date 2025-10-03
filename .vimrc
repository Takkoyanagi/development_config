set nocompatible              " required
filetype off                  " required

"------------Start vim-plug setup----------------
call plug#begin('~/.vim/plugged')

" Plugin manager itself (optional with vim-plug)
Plug 'junegunn/vim-plug'

" Python tools
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'shmup/vim-sql-syntax'
Plug 'tpope/vim-commentary'
Plug 'shaoran/vim-ruff'

let g:vimruff_default = "both"
let python_highlight_all=1
syntax on

" Colorschemes
" Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

" File navigation
Plug 'preservim/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$']

Plug 'kien/ctrlp.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Powerline
Plug 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim/' }

" Autocompletion
Plug 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Scala support
Plug 'derekwyatt/vim-scala'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" UltiSnips triggers
let g:UltiSnipsExpandTrigger="<f2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

call plug#end()
filetype plugin indent on
"------------End vim-plug setup----------------


" Enable folding
set foldmethod=indent
set foldlevel=110
" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8
set nu
set clipboard=unnamed
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Blue
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Cursor line
set cursorline
au InsertEnter * set cul
au InsertLeave * set nocul


"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=79

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"----------Stop python PEP 8 stuff--------------

"some togglables
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F8> :Ruff<CR>
