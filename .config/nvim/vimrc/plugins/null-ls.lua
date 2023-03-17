local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua.with({
			filetypes = { "lua" },
		}),
		null_ls.builtins.formatting.goimports.with({
			filetypes = { "go" },
		}),
		null_ls.builtins.formatting.shfmt.with({
			filetypes = { "sh", "bash" },
		}),
		null_ls.builtins.formatting.autopep8.with({
			filetypes = { "python" },
		}),
		null_ls.builtins.formatting.pg_format.with({
			filetypes = { "sql", "pgsql" },
		}),
		null_ls.builtins.formatting.terraform_fmt.with({
			filetypes = { "tf", "tfvars", "hcl", "terraform" },
		}),
		null_ls.builtins.formatting.eslint_d.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"graphql",
				"handlebars",
				"svelte",
			},
		}),
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"graphql",
				"handlebars",
				"svelte",
			},
		}),

		null_ls.builtins.diagnostics.hadolint.with({
			filetypes = { "dockerfile" },
		}),
        null_ls.builtins.diagnostics.eslint_d.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
        }),
	},
})
