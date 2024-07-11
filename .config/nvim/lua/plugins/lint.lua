return {
	"https://github.com/mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		local linters = lint.linters

		local function get_git_root()
			local command = "git rev-parse --show-toplevel"
			local file = io.popen(command):read("*l")
			return file and file or vim.fn.getcwd()
		end

		local function find_file(filename)
			local git_root = get_git_root()
			local command = "find" .. git_root .. "-name '" .. filename .. "' | head -n 1"
			local file = io.popen(command):read("*l")
			return file and file or nil
		end

		local use_golangci_config_if_available = function()
			local config_file = find_file(".golangci.yml")
			if config_file then
				print("Using golangci-lint config: " .. config_file)
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
				return linters.golangcilint.args
			end
		end

		linters.golangcilint.args = use_golangci_config_if_available()

		lint.linters_by_ft = {
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			go = { "golangcilint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
