" vim:set ts=2 sts=2 sw=2 expandtab:

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'slim-template/vim-slim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Shougo/vimproc'
Plug 'dense-analysis/ale'
Plug 'arcticicestudio/nord-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
call plug#end()

filetype plugin indent on
set nocompatible
set showmatch
set hlsearch
set incsearch
set ignorecase smartcase
set noerrorbells
set nowrap

hi clear SignColumn

syntax on
colorscheme nord
highlight Normal ctermbg=NONE
set number
set cindent
set visualbell

set showtabline=2

set nobackup
set nowritebackup
set showcmd
set nohlsearch
set noshowmode

let mapleader = ","

" Get the path to the current buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" set t_Co=256
set shell=/bin/zsh

set foldmethod=manual
set nofoldenable
set nojoinspaces
set autoread

set wildmenu

" Quickly switch between the last two files with ,,
map <LEADER><LEADER> <C-^>
 
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:40'
"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=40
"let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))|(dist|translatedTemplates)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/coverage/*
nmap <C-P> :FZF<CR>

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

"set mouse=a
let g:tsuquyomi_single_quote_import=1
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

let b:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'typescript.tsx': ['eslint']}
let b:ale_fixers = {'javascript': ['eslint'], 'typescript': ['eslint'], 'typescript.tsx': ['eslint']}
let b:ale_lint_on_text_changed = 'normal'
let b:ale_lint_on_insert_leave = 1
let b:ale_lint_delay = 0
let b:ale_set_quickfix = 0
let b:ale_set_loclist = 0
let g:airline#extensions#ale#enabled = 1
nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>
" This mapping will kill all ALE-related processes (including tsserver). It's
" necessary when those processes get confused. E.g., tsserver will sometimes
" show type errors that don't actually exist. I don't know exactly why that
" happens yet, but I think that it's related to renaming files.
nnoremap g0 :ALEStopAllLSPs<cr>

let g:tsuquyomi_disable_quickfix = 1

set rtp+=/usr/local/opt/fzf
set relativenumber
set rnu

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

function! s:SubStr(originalstring, pattern, replacement) abort
  return substitute(a:originalstring, a:pattern, a:replacement, "")
endfunction

function! AngularCssAlternate(cmd) 
  let l:currentpath = expand('%')
  let l:possiblepathsforalternatefile = []

  for possiblenewpath in [s:SubStr(l:currentpath, ".ts", ".scss")]
    if possiblenewpath != l:currentpath
      let l:possiblepathsforalternatefile = l:possiblepathsforalternatefile + [possiblenewpath]
    endif
  endfor

  for path in l:possiblepathsforalternatefile
    if filereadable(path)
      return  ':e ' . fnameescape(path)
    endif
  endfor

  return 'echoerr '.string("Couldn't find alternate file")
endfunction

map <C-t> :NERDTreeToggle %<CR>

nnoremap <silent> <leader>def :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>fix :YcmCompleter FixIt<CR>

"nnoremap <leader>h :wincmd h<CR>
"nnoremap <leader>j :wincmd j<CR>
"nnoremap <leader>k :wincmd k<CR>
"nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

" nnoremap <leader>vs :vsplit<CR>
" nnoremap <leader>hs :split<CR>

nnoremap <leader>ps :Rg<SPACE>

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" allow rg to detect the root
if executable('rg')
  let g:rg_derive_root='true'
endif

" sane commenting
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
