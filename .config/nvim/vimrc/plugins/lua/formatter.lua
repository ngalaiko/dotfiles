local formatter = require("formatter")

local eslint = function()
  return {
    exe = "eslint",
    args = {"--fix", "--no-ignore", "--stdin-filename", vim.api.nvim_buf_get_name(0)},
    stdin = false,
    cwd = vim.fn.expand("%:p:h") -- use cwd of the file
  }
end

local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
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
      javascript = {prettier, eslint},
      typescript = {prettier, eslint},
      vue = {prettier, eslint},
      svelte = {prettier, prettier},
      go = {goimports},
      lua = {luafmt},
      terraform = {terraform},
      bash = {shfmt},
      sh = {shfmt}
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd FileType bash autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType lua autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType javascript autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType typescript autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType sh autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType go autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType vue autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType terraform autocmd BufWritePost <buffer> silent FormatWrite
  autocmd FileType svelte autocmd BufWritePost <buffer> silent FormatWrite
augroup END
]],
  true
)
