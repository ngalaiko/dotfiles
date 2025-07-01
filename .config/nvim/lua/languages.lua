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
		lsp = {
			yamlls = {
				schemas = {
					["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/refs/tags/3.1.0/schemas/v3.0/schema.yaml"] = "/*",
				},
			},
		},
		packages = { "yaml-language-server" },
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
		formatters = { "golangci-lint" },
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
		packages = { "golangci-lint", "gopls" },
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
		linters = { "tflint", "trivy" },
		lsp = { terraformls = {} },
		packages = { "tflint", "terraform-ls", "trivy" },
	},
	{
		ft = { "sql" },
		formatters = { "sqlfmt" },
		packages = { "sqlfmt" },
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
