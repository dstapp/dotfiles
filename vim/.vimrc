execute pathogen#infect()
" syntax on
filetype plugin indent on
set cursorline
set hlsearch
hi CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=white
set number

hi clear SignColumn

set noshowmode

let mapleader = ","

" Get the path to the current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" set t_Co=256
set shell=/bin/zsh

syntax enable
set background=dark

" Quickly switch between the last two files with ,,
map <LEADER><LEADER> <C-^>
 
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:40'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))|(dist|translatedTemplates)$'

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

set laststatus=2

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

let g:vim_markdown_folding_disabled=1

fu! ResetSpaces()
    %retab!
endfunction

autocmd BufWritePre :call ResetSpaces()

" Execute current file
map <LEADER>. :!chmod +x % && ./%<cr>

" Split buffer vertically
map <LEADER>s :vert sb<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Load project specfic .vimrc if given
if findfile(".vimrc_local", ".") == ".vimrc_local"
    silent! so .vimrc_local
endif    

let g:tsuquyomi_shortest_import_path = 1
"let g:goyo_linenr = 1

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
au FileType gitcommit set tw=72

set mouse=a
let g:tsuquyomi_single_quote_import=1
