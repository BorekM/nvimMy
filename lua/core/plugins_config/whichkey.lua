local M = {}

M.opts = {
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
}

return M
-- require('which-key').setup{
--   opts = {
--     preset = "modern",
--     win = {
--       border = "rounded",
--       padding = { 1, 2 },
--       title = true,
--       title_pos = "center",
--     },
--     icons = {
--       breadcrumb = "»",
--       separator = "➜",
--       group = "+",
--     },
--     layout = {
--       width = { min = 20, max = 50 },
--       spacing = 3,
--     },
--   }}
