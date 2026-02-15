require("telescope").setup({
	file_ignore_patterns = { "node%_modules/.*" },
	defaults = {
		preview = {
			treesitter = false, -- This disables TS highlighting in the preview window
		},
	},
})
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Space>fs", builtin.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<Space>f<Space>", builtin.oldfiles, { desc = "Telescope: oldfiles" })
vim.keymap.set("n", "<Space>fg", builtin.live_grep, { desc = "Telescope: Find Grep" })
vim.keymap.set("n", "<Space>fh", builtin.help_tags, { desc = "Telescope: Find Help" })
vim.keymap.set("n", "<Space>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Space>fn", ":Telescope notify<CR>", { desc = "Telescope notify" })
