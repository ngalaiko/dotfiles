return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
	settings = {
		["rust-analyzer"] = {
			assist = {
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
			checkOnSave = true,
		},
	},
}
