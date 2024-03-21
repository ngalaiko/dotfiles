local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua.with({
			filetypes = { "lua" },
		}),
		null_ls.builtins.formatting.rufo.with({
			filetypes = { "ruby" },
		}),
		null_ls.builtins.formatting.erb_format.with({
			filetypes = { "eruby" },
		}),
		null_ls.builtins.formatting.goimports.with({
			filetypes = { "go" },
		}),
		null_ls.builtins.formatting.shfmt.with({
			filetypes = { "sh", "bash" },
		}),
		null_ls.builtins.formatting.pg_format.with({
			filetypes = { "sql", "pgsql" },
		}),
		null_ls.builtins.formatting.terraform_fmt.with({
			filetypes = { "tf", "tfvars", "hcl", "terraform" },
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

		null_ls.builtins.diagnostics.reek.with({
			filetypes = { "ruby" },
		}),
		null_ls.builtins.diagnostics.hadolint.with({
			filetypes = { "dockerfile" },
		}),
	},
})
