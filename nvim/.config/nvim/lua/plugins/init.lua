vim.cmd([[
call plug#begin('~/.local/share/nvim/site/autoload/plugged')
" Plug 'arcticicestudio/nord-vim'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'

" Fancy pants LUAline
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" Tree
Plug 'kyazdani42/nvim-tree.lua'

" Comments
Plug 'preservim/nerdcommenter'

" Match HTML tags
Plug 'leafOfTree/vim-matchtag'

" Search thingy
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
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

" Plug 'Mofiqul/dracula.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()
]])

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
    },

    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    },
  }
}
