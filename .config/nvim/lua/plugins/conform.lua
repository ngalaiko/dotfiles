return {
	"https://github.com/stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				go = { "gofumpt", "gci", "goimports" },
				python = { "black" },
				terraform = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
				sql = { "sqlfmt" },
				json = { "prettierd" },
				["_"] = { "trim_whitespace" },
			},
		})

		vim.keymap.set("n", "<space>f", function()
			conform.format()
		end, { noremap = true })
	end,
}
