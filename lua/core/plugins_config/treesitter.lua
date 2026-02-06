local M = {}

function M.setup()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript"},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    })
end

return M
