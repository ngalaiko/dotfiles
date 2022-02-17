local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.shfmt.with({
			extra_filetypes = { "bash" },
		}),
		null_ls.builtins.formatting.sqlformat,
		null_ls.builtins.formatting.prettier.with({
			extra_filetypes = { "svelte" },
		}),
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.diagnostics.hadolint,
		null_ls.builtins.code_actions.eslint_d.with({
			extra_filetypes = { "svelte" },
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
