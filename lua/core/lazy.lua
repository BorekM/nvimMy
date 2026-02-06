-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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
  spec = {
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
      "rmagatti/auto-session",
      lazy = false,
      keys = {
        -- Will use Telescope if installed or a vim.ui.select picker otherwise
        { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
        { "<leader>ws", "<cmd>AutoSession save<CR>",   desc = "Save session" },
        { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
      },
      ---enables autocomplete for opts
      ---@module "auto-session"
      ---@type AutoSession.Config
      opts = {
        -- The following are already the default values, no need to provide them if these are already the settings you want.
        session_lens = {
          picker = nil, -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
          mappings = {
            -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
            delete_session = { "i", "<C-d>" },
            alternate_session = { "i", "<C-s>" },
            copy_session = { "i", "<C-y>" },
          },

          picker_opts = {
          },

          load_on_setup = true,
        },
      },
    },
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" }, -- Načte se před uložením souboru
      cmd = { "ConformInfo" },
      keys = {
        {
          "<leader>f",
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end,
          mode = "",
          desc = "Formátovat soubor",
        },
      },
      opts = {
        -- Definice formátovačů pro konkrétní jazyky
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" }, -- Spustí isort a pak black
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
        },
        -- Nastavení formátování při uložení (:w)
        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true, -- Pokud není formatter, zkus LSP
        },
      },
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy", -- Načte se až když je potřeba
      opts = {
        preset = "modern",
        win = {
          border = "rounded",
          padding = { 1, 2 },
          title = true,
          title_pos = "center",
        },
        icons = {
          breadcrumb = "»",
          separator = "➜", -- Opraveny pravděpodobně rozbité znaky z tvého kopírování
          group = "+",
        },
        layout = {
          width = { min = 20, max = 50 },
          spacing = 3,
        },
      },
    },
    {
      'goolord/alpha-nvim',
      config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      end
    },
    {
      "nvzone/floaterm",
      dependencies = "nvzone/volt",
      opts = {},
      cmd = "FloatermToggle",
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },

    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.4",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
  },
  rocks = {
    enabled = false,   -- Úplně vypne podporu luarocks v lazy.nvim
    hererocks = false, -- Vypne automatickou instalaci hererocks
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },

})
