return {
	{
		ft = { "lua" },
		formatters = { "stylua" },
	},
	{
		ft = { "javascript", "javascriptreact" },
		formatters = { "prettierd" },
	},
	{
		ft = { "typescript", "typescriptreact" },
		formatters = { "prettierd" },
	},
	{
		ft = { "go" },
		formatters = { "golangci-lint" },
	},
	{
		ft = { "python" },
		formatters = { "ruff_format" },
	},
	{
		ft = { "terraform", "terraform-vars" },
		formatters = { "terraform_fmt" },
		linters = { "tflint", "trivy" },
	},
	{
		ft = { "sql" },
		formatters = { "sqlfmt" },
	},
	{
		ft = { "rust" },
		formatters = { "rustfmt" },
	},
}
