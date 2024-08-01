local languages = require("languages")
local linters_by_ft = {}
for _, language in ipairs(languages) do
	for _, ft in ipairs(language.ft) do
		linters_by_ft[ft] = language.linters or {}
	end
end

return {
	"https://github.com/mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		function get_git_root()
			local command = "git rev-parse --show-toplevel 2>/dev/null"
			local file = io.popen(command):read("*l")
			return file and file or nil
		end

		function find_file(filename)
			local git_root = get_git_root()
			if not git_root then
				return nil
			end
			local command = "find '"
				.. git_root
				.. "' -type d \\( -name 'node_modules' -o -name '.git' \\) -prune -o -type f -name '"
				.. filename
				.. "' -print | head -n 1"
			local file = io.popen(command):read("*l")
			return file and file or nil
		end

		local use_golangci_config_if_available = function()
			local config_file = find_file(".golangci.yml")
			if config_file then
				return {
					"run",
					"--out-format",
					"json",
					"--config",
					config_file,
					function()
						return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
					end,
				}
			else
				return lint.linters.golangcilint.args
			end
		end

		lint.linters.golangcilint.args = use_golangci_config_if_available()
		lint.linters_by_ft = linters_by_ft

		function debounce(ms, fn)
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

				lint.try_lint(nil, opts)
			end),
		})
	end,
}
