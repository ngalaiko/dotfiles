luafile $HOME/.config/nvim/vimrc/plugins/lua/nvim-lint.lua

au BufWritePost <buffer> lua require('lint').try_lint()
