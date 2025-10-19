local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function()
  builtin.find_files({ hidden = true })
end, {})
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      "deps",
      ".git"
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
