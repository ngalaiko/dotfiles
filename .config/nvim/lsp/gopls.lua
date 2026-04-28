return {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			analyses = {
				ST1000 = false, -- at least one file in a package should have a package comment
			},
			staticcheck = true,
		},
	},
}
