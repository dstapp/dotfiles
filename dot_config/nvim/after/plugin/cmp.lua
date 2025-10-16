local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-f>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
    end, { "i", "s" }),

    ["<C-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
    end, { "i", "s" }),

    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip", keyword_length = 2 },
    { name = "path" },
    { name = "buffer", keyword_length = 3 },
    { name = "nvim_lua" },
  },
})
