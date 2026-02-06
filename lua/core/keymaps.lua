-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<Space>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<Space>aa', ':Alpha<CR>', { desc = 'Home' })

vim.keymap.set('n', '<Space>l', ':Lazy<CR>', { desc = 'Lazy' })

vim.keymap.set('n', '<Space>t', ':FloatermToggle<CR>', { desc = 'Float term' })
