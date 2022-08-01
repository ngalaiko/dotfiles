local copilot = require("copilot")

copilot.setup({
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
	plugin_manager_path = vim.env.HOME .. "/.config/nvim/plugged",
})
