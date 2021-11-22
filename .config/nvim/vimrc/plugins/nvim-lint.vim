luafile $HOME/.config/nvim/vimrc/plugins/lua/nvim-lint.lua

autocmd BufWritePost <buffer> lua require('lint').try_lint()
