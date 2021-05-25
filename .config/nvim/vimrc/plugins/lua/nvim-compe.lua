local npairs = require'nvim-autopairs'

npairs.setup()
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = {kind = "﬘", true},
        calc = true,
        nvim_lsp = true,
    }
}

_G.MUtils = {}

MUtils.completion_confirm=function()
    if vim.fn.pumvisible() ~= 0  then
        if vim.fn.complete_info()["selected"] ~= -1 then
          vim.fn["compe#confirm"]()
          return npairs.esc("<c-y>")
        else
          vim.fn.nvim_select_popupmenu_item(0, false, false,{})
          vim.fn["compe#confirm"]()
          return npairs.esc("<c-n><c-y>")
        end
    else
        return npairs.check_break_line_char()
    end
end

MUtils.tab=function()
    if vim.fn.pumvisible() ~= 0  then
        return npairs.esc("<C-n>")
    else
        if vim.fn["vsnip#available"](1) ~= 0 then
            return vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
        else
            return npairs.esc("<Tab>")
        end
    end
end

MUtils.s_tab=function()
    if vim.fn.pumvisible() ~= 0  then
        return npairs.esc("<C-p>")
    else
        if vim.fn["vsnip#jumpable"](-1) ~= 0 then
            return vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
        else
            return npairs.esc("<C-h>")
        end
    end
end

function imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap('i', lhs, rhs, options)
end

-- Autocompletion and snippets
imap("<CR>", "v:lua.MUtils.completion_confirm()", {expr = true , noremap = true})
imap("<Tab>", "v:lua.MUtils.tab()", {expr = true , noremap = true})
imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true , noremap = true})
