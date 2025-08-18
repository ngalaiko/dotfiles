return {
	{
		ft = { "lua" },
		formatters = { "stylua" },
		lsp = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			},
		},
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
	},
	{
		ft = { "javascript", "javascriptreact" },
		formatters = { "prettierd" },
		linters = { "eslint_d" },
		lsp = { ts_ls = {} },
	},
	{
		ft = { "typescript", "typescriptreact" },
		formatters = { "prettierd" },
		linters = { "eslint_d" },
		lsp = { ts_ls = {} },
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
							ST1000 = false, --  at least one file in a package should have a package comment
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
		lsp = { svelte = {} },
	},
	{
		ft = { "python" },
		formatters = { "black" },
		lsp = { pylsp = {} },
	},
	{
		ft = { "terraform", "terraform-vars" },
		formatters = { "terraform_fmt" },
		linters = { "tflint", "trivy" },
		lsp = { terraformls = {} },
	},
	{
		ft = { "sql" },
		formatters = { "sqlfmt" },
	},
	{
		ft = { "html" },
		lsp = { html = {} },
	},
	{
		ft = { "css" },
		lsp = { cssls = {} },
	},
	{
		ft = { "bash", "sh" },
		lsp = { bashls = {} },
	},
	{
		ft = { "dockerfile" },
		lsp = { dockerls = {} },
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
	},
}
