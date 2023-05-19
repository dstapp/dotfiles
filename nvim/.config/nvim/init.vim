:lua require 'plugins'
:lua require 'coc'
:lua require 'lualine-config'
:lua require 'autopairs-config'
:lua require 'nvim-tree-config'
:lua require 'mappings'

let mapleader = ","
" source current file
nnoremap <leader><CR> :so %<CR>

" sane defaults
"
" basic syntax highlighting
syntax on
" turn of sounds
set noerrorbells

set visualbell
" tabstop = changes the width of the TAB character, plain and simple; softtabstop = affects what happens when you press the <TAB>
set tabstop=2 softtabstop=2
" shiftwidth = affects what happens when you press >>, << or ==. It also affects how automatic indentation works.
set shiftwidth=2
" affects what happens when you press the <TAB> key. If 'expandtab' is set, pressing the <TAB> key will always insert 'softtabstop' amount of space characters. Otherwise, the amount of spaces inserted is minimized by using TAB characters.
set expandtab
" automatically inserts one extra level of indentation in some cases, and works for C-like files.
set smartindent
" set line numbers
set nu
" no line wrap
set nowrap
" use case if any caps used
set smartcase
" don't create swap files
set noswapfile
" don't create backup files
set nobackup
" persistent undo
" set undodir=~/.vim/undodir

" set undofile
" search while typing
set incsearch
" Autocomplete (ctrl + x, ctrl + o)
filetype plugin on

set omnifunc=syntaxcomplete#Complete

set relativenumber

set cursorline

set backspace=indent,eol,start

set hlsearch

set scrolloff=8

" " Better whitespace
" let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

set list
" colorscheme nord
" set termguicolors
" set background=dark
" highlight Beacon guibg=white ctermbg=NONE

"let g:lightline = {
"    \ 'colorscheme': 'nord',
"    \ }


" Nerdcommander
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1"

" Telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>
nnoremap <leader>R <cmd>Telescope resume<cr>

" Somehow you need to be able to exit insert mode from the terminal again
:tnoremap <Esc> <C-\><C-n>

" Gitblamer
let g:blamer_enabled = 1

" show quotes
let g:indentLine_setConceal = 0
