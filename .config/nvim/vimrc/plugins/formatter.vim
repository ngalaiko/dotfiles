luafile $HOME/.config/nvim/vimrc/plugins/lua/formatter.lua

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost <buffer> FormatWrite
augroup END
