local formatter = require("formatter")

local eslint = function()
  return {
    exe = "prettier-eslint",
    args = {"--stdin", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true,
    cwd = vim.fn.expand("%:p:h") -- use cwd of the file
  }
end

local goimports = function()
  return {
    exe = "goimports",
    stdin = true
  }
end

local luafmt = function()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

local terraform = function()
  return {
    exe = "terraform",
    args = {"fmt", "-"},
    stdin = true
  }
end

local shfmt = function()
  return {
    exe = "shfmt",
    args = {"-i", 2},
    stdin = true
  }
end

local luafmt =
  formatter.setup(
  {
    filetype = {
      javascript = {eslint},
      typescript = {eslint},
      vue = {eslint},
      go = {goimports},
      lua = {luafmt},
      terraform = {terraform},
      bash = {shfmt}
    }
  }
)
