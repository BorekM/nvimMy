require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

vim.keymap.set("n", "<Space>nn", ":NvimTreeFindFile<CR>")
local function open_nvim_tree(data)
	-- 1. Pokud otevíráme adresář (např. nvim .)
	local is_directory = vim.fn.isdirectory(data.file) == 1

	-- 2. Pokud otevíráme nvim úplně "naprázdno" (bez souborů)
	local is_empty = data.file == "" and vim.bo.buftype == ""

	if is_directory or is_empty then
		require("nvim-tree.api").tree.open()
	end
end

-- Registrace s ošetřením chyb
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = open_nvim_tree,
})
