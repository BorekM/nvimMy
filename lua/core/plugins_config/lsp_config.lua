-- 1. Mason a Mason-LSPConfig (zůstávají pro instalaci binárek)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls",  "tailwindcss" }
})

-- 2. Capabilities (standardní pro nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status_cmp then
  capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())
end

-- 3. NOVÝ PŘÍSTUP (Neovim 0.11+)
-- Místo lspconfig.server.setup() použijeme nativní vim.lsp.config
-- Tímto se zcela vyhneme lspconfig frameworku.
-- 1. Konfigurace globálního chování diagnostiky
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●', -- nebo '■', '󰋽' atd.
  },
  signs = true,     -- Ponechá ikonky na levé straně
  underline = true, -- Podtrhne chybný kód
  update_in_insert = false, -- Neaktualizovat při psaní (méně rušivé)
  severity_sort = true,
})

-- 2. Volitelné: Změna ikonek v sign column (pokud chceš místo písmen E, W ikony)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
  local name = "DiagnosticSign" .. type
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = name })
end

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  },
  ts_ls = {},
  solargraph = {},
  gopls = {},
  tailwindcss = {},
}

-- Registrace serverů pomocí nového API
for server_name, server_opts in pairs(servers) do
  server_opts.capabilities = vim.tbl_deep_extend('force', capabilities, server_opts.capabilities or {})
  
  -- Toto je to, co doporučuje :help lspconfig-nvim-0.11
  -- Použijeme lspconfig jen jako zdroj defaultní konfigurace, ale setup děláme "čistě"
  local config = require('lspconfig.configs')[server_name]
  if config then
    config.setup(server_opts)
  end
end

-- 4. Autocommand LspAttach (zůstává stejný, je to moderní standard)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- ... zbytek tvých mapování
  end,
})
