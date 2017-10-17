execute pathogen#infect()
syntax on
filetype plugin indent on
" colorscheme gruvbox
set cursorline
set hlsearch
hi CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=white
set number

hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
" hi EndOfBuffer ctermfg=237 ctermbg=235

set noshowmode

let mapleader = ","

" Get the path to the current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" set t_Co=256
set shell=/bin/zsh

" Enable mouse support
"set mouse=a

" Quickly switch between the last two files with ,,
map <LEADER><LEADER> <C-^>

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:40'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

map <F10> :e $MYVIMRC<CR>
map <F12> :so $MYVIMRC<CR> 

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

set laststatus=2

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
