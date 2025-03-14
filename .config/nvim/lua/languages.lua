return {
	{
		ft = { "lua" },
		formatters = { "stylua" },
		packages = { "stylua" },
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
		lsp = { ts_ls = {} },
		packages = { "eslint_d", "prettierd" },
	},
	{
		ft = { "typescript", "typescriptreact" },
		formatters = { "prettierd" },
		linters = { "eslint_d" },
		lsp = { ts_ls = {} },
		packages = { "eslint_d", "prettierd", "typescript-language-server" },
	},
	{
		ft = { "go" },
		formatters = { "gofumpt", "gci", "goimports" },
		linters = { "golangcilint" },
		packages = { "golsp" },
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
		packages = { "gofumpt", "gci", "goimports", "golangci-lint", "gopls" },
	},
	{
		ft = { "gomod" },
	},
	{
		ft = { "svelte" },
		lsp = { svelte = {} },
		packages = { "svelte-language-server" },
	},
	{
		ft = { "python" },
		formatters = { "black" },
		lsp = { pylsp = {} },
		packages = { "black", "python-lsp-server" },
	},
	{
		ft = { "terraform", "terraform-vars" },
		formatters = { "terraform_fmt" },
		linters = { "tflint", "tfsec" },
		lsp = { terraformls = {} },
		packages = { "tflint", "tfsec", "terraform-ls" },
	},
	{
		ft = { "sql" },
		formatters = { "sqlfmt" },
		packages = { "sqlfmt" },
	},
	{
		ft = { "proto" },
		linters = { "buf_lint" },
		lsp = { buf_ls = {} },
		packages = { "buf", "buf-language-server" },
	},
	{
		ft = { "html" },
		lsp = { html = {} },
		packages = { "html-lsp" },
	},
	{
		ft = { "css" },
		lsp = { cssls = {} },
		packages = { "css-lsp" },
	},
	{
		ft = { "bash", "sh" },
		lsp = { bashls = {} },
		packages = { "bash-language-server" },
	},
	{
		ft = { "dockerfile" },
		lsp = { dockerls = {} },
		packages = { "dockerfile-language-server" },
	},
	{
		ft = { "rust" },
		formatters = { "rustfmt" },
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
		packages = { "rust-analyzer" },
	},
}
