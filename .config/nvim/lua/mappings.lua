vim.g.mapleader = ","

local function set_keymap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- split tab vertically and horizontally
vim.keymap.set("n", "<leader>v", vim.cmd.vsp)
vim.keymap.set("n", "<leader>s", vim.cmd.sp)

-- Move lines around (macOS <A-j> = ˚ <A-k> = ∆)
set_keymap("n", "∆", ":m+<CR>==")
set_keymap("n", "˚", ":m-2<CR>==")
set_keymap("i", "∆", "<Esc>:m .+1<CR>==gi")
set_keymap("i", "˚", "<Esc>:m .-2<CR>==gi")
set_keymap("v", "∆", ":m'>+<CR>gv=gv")
set_keymap("v", "˚", ":m'<-2<CR>gv=gv")

-- Double ESC to unhilight search
set_keymap("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>")

-- Treat long lines as break lines (useful when moving around in them)
set_keymap("", "j", "gj")
set_keymap("", "k", "gk")

-- visual shifting (does not exit Visual mode)
set_keymap("v", "<", "<gv")
set_keymap("v", ">", ">gv")
