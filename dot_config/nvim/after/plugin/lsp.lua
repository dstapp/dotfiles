local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('rust_analyzer', {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable('rust_analyzer')

vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
vim.lsp.enable('lua_ls')

vim.lsp.config('gopls', {
  on_attach = on_attach,  -- Your custom keymaps/handlers
  capabilities = capabilities,  -- Your cmp_nvim_lsp capabilities
  settings = {
    gopls = {
      gofumpt = true, -- Use gofumpt formatting
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
})
vim.lsp.enable('gopls')

-- TypeScript configuration using typescript-tools
require('typescript-tools').setup({
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    
    -- Override the default gd mapping for TypeScript files
    vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr, desc = "Go to Source Definition" })
    vim.keymap.set("n", "gD", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr, desc = "Go to Source Definition" })
    vim.keymap.set("n", "K", "<cmd>TSToolsHover<cr>", { buffer = bufnr, desc = "Hover" })
    vim.keymap.set("n", "<leader>rn", "<cmd>TSToolsRename<cr>", { buffer = bufnr, desc = "Rename" })
    vim.keymap.set("n", "<leader>ca", "<cmd>TSToolsCodeActions<cr>", { buffer = bufnr, desc = "Code Actions" })
    vim.keymap.set("n", "<leader>rf", "<cmd>TSToolsRenameFile<cr>", { buffer = bufnr, desc = "Rename File" })
    vim.keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<cr>", { buffer = bufnr, desc = "Organize Imports" })
    vim.keymap.set("n", "<leader>ru", "<cmd>TSToolsRemoveUnused<cr>", { buffer = bufnr, desc = "Remove Unused" })
    vim.keymap.set("n", "<leader>fa", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
    vim.keymap.set("n", "<leader>da", "<cmd>TSToolsAddMissingImports<cr>", { buffer = bufnr, desc = "Add Missing Imports" })
  end,
  capabilities = capabilities,
  settings = {
    tsserver = {
      -- Enable inlay hints
      inlay_hints = {
        enabled = true,
        include_inlay_parameter_name_hints = 'all',
        include_inlay_parameter_name_hints_when_argument_matches_name = false,
        include_inlay_function_parameter_type_hints = true,
        include_inlay_variable_type_hints = true,
        include_inlay_property_declaration_type_hints = true,
        include_inlay_function_like_return_type_hints = true,
        include_inlay_enum_member_value_hints = true,
      },
    },
  },
})

require("elixir").setup({
  nextls = {enable = false},
  elixirls = {enable = true},
  projectionist = {enable = true},
})
