local lualine = require "lualine"

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    always_divide_middle = true,
    disabled_filetypes = {"NvimTree"}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
      "branch",
      "diff"
    },
    lualine_c = {"filename"},
    lualine_x = {
      {
        "diagnostics",
        sources = {"nvim_diagnostic"},
        sections = {"error", "warn", "info", "hint"}
      },
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  }
}
