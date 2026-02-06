
require('which-key').setup{
  options = {
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
  }}
