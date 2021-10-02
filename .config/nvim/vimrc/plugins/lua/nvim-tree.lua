require'nvim-tree'.setup{
    open_on_setup       = true,
    auto_close          = true,
    update_cwd          = true,
    hijack_cursor       = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = false,
    },
    view = {
        auto_resize = true,
    }
}
