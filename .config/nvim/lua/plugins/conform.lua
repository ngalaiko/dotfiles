return {
	"https://github.com/stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				go = { "gofumpt", "gci", "goimports" },
				python = { "black" },
				terraform_fmt = { "terraform", "terraform-vars" },
				["_"] = { "trim_whitespace" },
			},
		})

		vim.keymap.set("n", "<space>f", function()
			conform.format()
		end, { noremap = true })
	end,
}
