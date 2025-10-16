local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      "deps",
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
