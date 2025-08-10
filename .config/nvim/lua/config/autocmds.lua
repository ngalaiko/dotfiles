local function debounce(ms, fn)
	local timer = vim.uv.new_timer()
	return function(...)
		local argv = { ... }
		timer:start(ms, 0, function()
			timer:stop()
			vim.schedule_wrap(fn)(unpack(argv))
		end)
	end
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
	callback = debounce(100, function()
		local opts = {}

		-- support monorepos by using cwd as detected by active lsp
		local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
		local client = get_clients({ bufnr = 0 })[1]
		if client then
			opts.cwd = client.root_dir
		end

		require("lint").try_lint(nil, opts)
	end),
})
