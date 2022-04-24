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
		null_ls.builtins.formatting.prettier.with({
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
			},
		}),

		null_ls.builtins.diagnostics.hadolint.with({
			filetypes = { "dockerfile" },
		}),
		null_ls.builtins.diagnostics.golangci_lint.with({
			filetypes = { "go" },
		}),
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
