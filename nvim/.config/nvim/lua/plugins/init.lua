vim.cmd([[
call plug#begin('~/.local/share/nvim/site/autoload/plugged')
Plug 'arcticicestudio/nord-vim'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" Fancy pants LUAline
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" Comments
Plug 'preservim/nerdcommenter'

" Match HTML tags
Plug 'leafOfTree/vim-matchtag'

" Search thingy
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Emmet
Plug 'mattn/emmet-vim'

" Close parens directly
" Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'

" Vertikale strichelcher
Plug 'Yggdroot/indentLine'

" TS integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin startup time profiling
Plug 'tweekmonster/startuptime.vim'

" Something with buffers
Plug 'jeetsukumaran/vim-buffergator'
call plug#end()
]])
