require("telescope").setup({
	file_ignore_patterns = { "node%_modules/.*" },
	defaults = {
		preview = {
			treesitter = false, -- This disables TS highlighting in the preview window
		},
	},
})
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Space>s", builtin.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, { desc = "Telescope: oldfiles" })
vim.keymap.set("n", "<Space>g", builtin.live_grep, { desc = "Telescope: Find Grep" })
vim.keymap.set("n", "<Space>h", builtin.help_tags, { desc = "Telescope: Find Help" })
vim.keymap.set("n", "<Space>b", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Space>nh", ":Telescope notify<CR>", { desc = "Telescope notify" })
