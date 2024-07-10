require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		go = { "gofumpt", "gci", "goimports" },
		python = { "black" },
		terraform_fmt = { "tf", "tfvars", "hcl", "terraform" },
		["_"] = { "trim_whitespace" },
	},
})
