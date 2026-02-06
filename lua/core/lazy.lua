-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
  "folke/which-key.nvim", -- Jméno pluginu (MUSÍ ZDE BÝT)
  event = "VeryLazy",
  opts = {
    -- Zde začíná vaše konfigurace (to, co vyvolalo chybu)
    preset = "modern",
    win = {
      border = "rounded",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    layout = {
      width = { min = 20, max = 50 },
      spacing = 3,
    },
  },
  -- Tato funkce zajistí, že se setup zavolá s výše definovanými opts
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
},
  {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
},
  {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
