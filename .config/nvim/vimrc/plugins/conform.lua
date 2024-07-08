require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		go = { "gofumpt", "gci" },
		python = { "black" },
		terraform_fmt = { "tf", "tfvars", "hcl", "terraform" },
		["_"] = { "trim_whitespace" },
	},
})
