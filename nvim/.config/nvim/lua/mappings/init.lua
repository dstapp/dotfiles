local map = vim.api.nvim_set_keymap
local opts =  { noremap = true, silent = true }

vim.g.mapleader = ","

--> splits <--
-- map("n", "<leader>w", "<C-w><C-w>", opts)
-- map("n", "<leader>vs", ":vsplit<CR>", opts)
-- map("n", "<leader>hs", ":split<CR>", opts)
-- map("n", "<leader>+", ":exe \"resize \" . (winheight(0) * 3/2)<CR>", opts)
-- map("n", "<leader>-", ":exe \"resize \" . (winheight(0) * 2/3)<CR>", opts)
-- map("n", "<leader><CR>", ":luafile %<CR>", opts)
-- 
-- map("n", "<leader>l", "<C-w>l", opts)
-- map("n", "<leader>h", "<C-w>h", opts)
-- map("n", "<leader>j", "<C-w>j", opts)
-- map("n", "<leader>k", "<C-w>k", opts)
-- 
-- --> telescope <--
-- map("n", "<leader>f", ":Telescope find_files<cr>", opts)
-- map("n", "<leader>F", ":Telescope live_grep<cr>", opts)

--> nvim tree mappings <--
map("n", "<leader>N", ":NvimTreeFindFile<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

--> Coc codeaction <--
-- map("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
