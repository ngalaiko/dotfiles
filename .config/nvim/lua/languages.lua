return {
	{
		ft = { "lua" },
		formatters = { "stylua" },
	},
	{
		ft = { "json" },
	},
	{
		ft = { "ledger" },
	},
	{
		ft = { "yaml" },
	},
	{
		ft = { "graphql" },
	},
	{
		ft = { "javascript", "javascriptreact" },
		formatters = { "prettierd" },
		linters = { "eslint_d" },
	},
	{
		ft = { "typescript", "typescriptreact" },
		formatters = { "prettierd" },
		linters = { "eslint_d" },
		lsp = { "tsserver" },
	},
	{
		ft = { "go" },
		formatters = { "gofumpt", "gci", "goimports" },
		linters = { "golangcilint" },
		lsp = {
			gopls = {
				cmd = { "gopls", "serve" },
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			},
		},
	},
	{
		ft = { "gomod" },
	},
	{
		ft = { "svelte" },
		lsp = { "svelte" },
	},
	{
		ft = { "python" },
		formatters = { "black" },
		lsp = { "pylsp" },
	},
	{
		ft = { "terraform", "terraform-vars" },
		formatters = { "terraform_fmt" },
		linters = { "tflint", "tfsec" },
		lsp = { "terraformls" },
	},
	{
		ft = { "sql" },
		formatters = { "sqlfmt" },
	},
	{
		ft = { "proto" },
		lsp = { "bufls" },
	},
	{
		ft = { "html" },
		lsp = { html },
	},
	{
		ft = { "css" },
		lsp = { cssls },
	},
	{
		ft = { "sh", "bash" },
		lsp = { "bashls" },
	},
	{
		ft = { "dockerfile" },
		lsp = { "dockerls" },
	},
	{
		ft = { "rust" },
		lsp = {
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						assist = {
							importMergeBehavior = "last",
							importPrefix = "by_self",
						},
						cargo = {
							loadOutDirsFromCheck = true,
							features = "all",
							buildScripts = {
								enable = false,
							},
						},
						check = {
							features = "all",
						},
						procMacro = {
							enable = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		},
	},
}
