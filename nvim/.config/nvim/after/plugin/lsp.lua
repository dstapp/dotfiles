-- LSP keymaps
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- Enhanced navigation with fallbacks
  vim.keymap.set("n", "gd", function()
    -- Try LSP definition first, fallback to Telescope if it fails
    local success, result = pcall(vim.lsp.buf.definition)
    if not success or not result then
      require('telescope.builtin').lsp_definitions()
    end
  end, opts)
  
  vim.keymap.set("n", "gD", function()
    -- Always use Telescope for definitions (better for complex imports)
    require('telescope.builtin').lsp_definitions()
  end, { desc = "Go to definition (Telescope)" })
  
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
  
  -- Additional navigation methods
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>ds", require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)

  -- Auto-import missing symbols via tsserver
  local function import_missing()
    vim.lsp.buf.code_action({
      context = { only = { "quickfix" } },
      apply = true, -- Automatically applies the fix
    })
  end

  vim.keymap.set("n", "<leader>im", import_missing, { desc = "Import missing symbols (TS)" })

  -- Function to add all missing imports in the file using source code action
  local function add_all_missing_imports()
    vim.lsp.buf.code_action({
      context = {
        only = { "source.addMissingImports.ts" }
      },
      apply = true, -- Auto-applies the code action if only one
    })
  end

  vim.keymap.set("n", "<leader>ai", add_all_missing_imports, { desc = "Add all missing imports (TS)" })
  
  -- LSP debugging and status
  vim.keymap.set("n", "<leader>ls", function()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients == 0 then
      print("No LSP clients attached")
    else
      for _, client in ipairs(clients) do
        print(string.format("LSP: %s (id: %d)", client.name, client.id))
        print(string.format("  Root: %s", client.config.root_dir or "Not set"))
        print(string.format("  Capabilities: %s", vim.inspect(client.server_capabilities)))
      end
    end
  end, { desc = "Show LSP status" })
  
  vim.keymap.set("n", "<leader>lr", function()
    vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = bufnr }))
    vim.cmd("edit")
  end, { desc = "Restart LSP" })
end

-- nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = {
      preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    javascript = {
      preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
  },
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern('tsconfig.json', 'package.json', '.git')(fname) or vim.fn.getcwd()
  end,
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
