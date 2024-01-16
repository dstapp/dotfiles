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

" Golang
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

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



require('go').setup()

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})


