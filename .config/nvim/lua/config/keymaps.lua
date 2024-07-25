vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>o", ":Neotree toggle<CR>")
map("n", "<leader>O", ":Neotree focus<CR>")

map("n", "J", "mzJ'z")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", '"_dP')

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

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
