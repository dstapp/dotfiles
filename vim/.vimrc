" vim:set ts=2 sts=2 sw=2 expandtab:

call plug#begin('~/.vim/plugged')
Plug 'slim-template/vim-slim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'heavenshell/vim-tslint'
call plug#end()

" execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set cursorline
set showmatch
set hlsearch
set incsearch
set ignorecase smartcase
hi CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=white
set number

hi clear SignColumn

set showtabline=2

set nobackup
set nowritebackup
set showcmd

set noshowmode

let mapleader = ","

" Get the path to the current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" set t_Co=256
set shell=/bin/zsh
filetype plugin indent on

set foldmethod=manual
set nofoldenable
set nojoinspaces
set autoread

set wildmenu

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

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start

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
    if !col
        return "\<tab>"
    endif

    let char = getline('.')[col - 1]
    if char =~ '\k'
        " There's an identifier before the cursor, so complete the identifier.
        return "\<c-p>"
    else
        return "\<tab>"
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
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

let g:ale_linters = {'javascript': [], 'typescript': ['tsserver'], 'typescript.tsx': ['tsserver']}
let g:ale_fixers = {'javascript': [], 'typescript': ['prettier'], 'typescript.tsx': ['prettier']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>
" This mapping will kill all ALE-related processes (including tsserver). It's
" necessary when those processes get confused. E.g., tsserver will sometimes
" show type errors that don't actually exist. I don't know exactly why that
" happens yet, but I think that it's related to renaming files.
nnoremap g0 :ALEStopAllLSPs<cr>

let g:tsuquyomi_disable_quickfix = 1

augroup tslint
  function! s:typescript_after(ch, msg)
    let cnt = len(getqflist())
    if cnt > 0
      echomsg printf('[Tslint] %s errors', cnt)
    endif
  endfunction
  let g:tslint_callbacks = {
    \ 'after_run': function('s:typescript_after')
    \ }

  let g:tsuquyomi_disable_quickfix = 1

  function! s:ts_quickfix()
    let winid = win_getid()
    execute ':TsuquyomiGeterr'
    call tslint#run('a', winid)
  endfunction

  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
  autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
augroup END
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

set rtp+=/usr/local/opt/fzf
