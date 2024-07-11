return {
	"https://github.com/neovim/nvim-lspconfig",
	config = function()
		local nvim_lsp = require("lspconfig")
		local util = require("lspconfig/util")
		local servers = {
			bufls = {},
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
			terraformls = {},
			solargraph = {},
			html = {},
			cssls = {},
			bashls = {},
			dockerls = {},
			vimls = {},
			clojure_lsp = {},
			volar = {
				filetypes = { "vue" },
			},
			tsserver = {},
			tailwindcss = {},
			svelte = {},
			pylsp = {},
			hls = {},
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
		}

		-- prefix/character preceding the diagnostics' virtual text
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = {
				prefix = "▎", -- Could be '■', '●', 'x'
			},
		})

		-- replace the default lsp diagnostic letters with prettier symbols
		local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- nvim-cmp source setup
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		for server, value in pairs(servers) do
			value.capabilities = capabilities
			value.capabilities.textDocument.completion.completionItem.snippetSupport = false
		end

		-- change diagnostic signs
		vim.cmd([[
  			sign define DiagnosticSignError text=  texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  			sign define DiagnosticSignWarn text=  texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  			sign define DiagnosticSignInfo text=  texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  			sign define DiagnosticSignHint text=  texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]])

		-- register servers
		for server, value in pairs(servers) do
			nvim_lsp[server].setup(value)
		end

		-- Utility function to set key mappings
		local function set_keymap(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end

		-- Go to definition
		set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")

		-- Go to references
		set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

		-- Go to implementation
		set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")

		-- Change definition
		set_keymap("n", "cd", "<cmd>lua vim.lsp.buf.rename()<CR>")

		-- Set location list (commented out)
		-- set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

		-- Format buffer (commented out)
		-- set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>')

		-- Show signature help
		set_keymap("n", "<space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

		-- Show hover documentation
		set_keymap("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
	end,
}
