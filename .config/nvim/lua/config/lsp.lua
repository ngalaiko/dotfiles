vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({
	"bashls",
	"cssls",
	"dockerls",
	"eslint",
	"golangci_lint_ls",
	"gopls",
	"html",
	"lua_ls",
	"ruff",
	"rust_analyzer",
	"svelte",
	"templ",
	"terraformls",
	"ts_ls",
	"yamlls",
})
