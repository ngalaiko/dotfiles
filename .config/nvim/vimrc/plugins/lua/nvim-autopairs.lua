local npairs = require'nvim-autopairs'

npairs.setup()

function _G.completions()
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})
