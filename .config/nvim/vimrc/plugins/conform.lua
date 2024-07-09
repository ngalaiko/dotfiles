require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		go = { "gofumpt", "gci", "goimports" },
		python = { "black" },
		terraform_fmt = { "tf", "tfvars", "hcl", "terraform" },
		["_"] = { "trim_whitespace" },
	},
})
