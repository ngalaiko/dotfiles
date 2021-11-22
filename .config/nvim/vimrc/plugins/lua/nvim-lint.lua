local lint = require('lint')

lint.linters_by_ft = {
  markdown = {'vale'},
  vue = {'eslint'},
  javascript = {'eslint'},
  typescript = {'eslint'},
  dockerfile = {'hadolint'},
  bash = {"shellcheck"},
  lua = {"luacheck"},
}
