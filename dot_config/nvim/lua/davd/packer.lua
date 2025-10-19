-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'},
    }
  }

  use 'Mofiqul/dracula.nvim'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('airblade/vim-gitgutter')
  use('APZelos/blamer.nvim')

  -- Native LSP support
  use 'neovim/nvim-lspconfig'

  -- Autocompletion engine
  use 'hrsh7th/nvim-cmp'

  -- Completion sources
  use 'hrsh7th/cmp-nvim-lsp'      -- LSP source (required)
  use 'hrsh7th/cmp-buffer'        -- Text in buffer (optional)
  use 'hrsh7th/cmp-path'          -- Filesystem paths (optional)
  use 'hrsh7th/cmp-nvim-lua'      -- Neovim Lua API completions (optional)

  -- Snippets
  use 'L3MON4D3/LuaSnip'          -- Snippet engine (optional)
  use 'saadparwaiz1/cmp_luasnip'  -- Connects LuaSnip to nvim-cmp (optional)

  -- Snippet collections (optional)
  -- use 'rafamadriz/friendly-snippets'

  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  }

  use({
    "elixir-tools/elixir-tools.nvim",
    tag = "stable", 
    requires = { "nvim-lua/plenary.nvim" }
  })

  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = { ".git" },
            hide_by_name = { "node_modules", ".git" }
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
      })
    end
  })
end)
