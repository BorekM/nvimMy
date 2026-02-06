require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>ff', builtin.find_files, {desc = 'Telescope: Find Files'})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {desc = 'Telescope: oldfiles'})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {desc = 'Telescope: Find Grep'})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {desc = 'Telescope: Find Help'})
