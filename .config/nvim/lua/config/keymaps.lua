vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- trouble
map("n", "<space>q", "<cmd>Trouble diagnostics toggle<CR>")

-- picker
map("n", "<C-P>", ":Pick files<CR>")
map("n", "<leader>ps", ":Pick grep<CR>")

-- outline
map("n", "<leader>tt", "<cmd>Outline<CR>")

-- navigator
map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")

-- lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "cd", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- copilot
map("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- conform
map("n", "<space>f", function()
	require("conform").format()
end)

-- neotree
map("n", "<leader>o", ":Neotree toggle<CR>")
map("n", "<leader>O", ":Neotree reveal<CR>")

-- split tab vertically and horizontally
map("n", "<leader>v", vim.cmd.vsp)
map("n", "<leader>s", vim.cmd.sp)

-- Move lines around (macOS <A-j> = ˚ <A-k> = ∆)
map("n", "∆", ":m+<CR>==")
map("n", "˚", ":m-2<CR>==")
map("i", "∆", "<Esc>:m .+1<CR>==gi")
map("i", "˚", "<Esc>:m .-2<CR>==gi")
map("v", "∆", ":m'>+<CR>gv=gv")
map("v", "˚", ":m'<-2<CR>gv=gv")

-- Double ESC to unhilight search
map("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>")

-- Treat long lines as break lines (useful when moving around in them)
map("", "j", "gj")
map("", "k", "gk")

-- visual shifting (does not exit Visual mode)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- visual shifting up and down
map("v", "J", ": m'>+1<CR>gv=gv")
map("v", "K", ": m'<-2<CR>gv=gv")
