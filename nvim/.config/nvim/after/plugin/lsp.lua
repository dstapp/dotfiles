-- LSP keymaps
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable('ts_ls')

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
