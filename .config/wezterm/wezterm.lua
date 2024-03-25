local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function isViProcess(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds in Neovim.
			wezterm.action.SendKey({ key = vim_direction, mods = "CTRL" }),
			pane
		)
	else
		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

config.color_scheme = "zenwritten_dark"
config.font = wezterm.font_with_fallback({
	"Berkeley Mono",
	"Symbols Nerd Font Mono",
})
config.use_dead_keys = false
config.scrollback_lines = 5000

config.window_frame = {
	font = wezterm.font({ family = "Berkeley Mono", weight = "Bold" }),
}

config.font_size = 15.0

config.disable_default_key_bindings = true

config.key_tables = {
	search_mode = {
		{ key = "Escape", mods = "NONE", action = wezterm.action.CopyMode("Close") },
		{ key = "n", mods = "CTRL", action = wezterm.action.CopyMode("NextMatch") },
		{ key = "N", mods = "CTRL|SHIFT", action = wezterm.action.CopyMode("PriorMatch") },
		{ key = "r", mods = "CTRL", action = wezterm.action.CopyMode("CycleMatchType") },
		{ key = "u", mods = "CTRL", action = wezterm.action.CopyMode("ClearPattern") },
	},
}

config.adjust_window_size_when_changing_font_size = false

config.keys = {
	-- font size
	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },

	-- search mode
	{
		key = "f",
		mods = "CTRL|ALT",
		action = wezterm.action({ Search = { CaseInSensitiveString = "" } }),
	},

	-- resize panes
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
	},

	-- navigation between panes
	{ key = "h", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "CTRL", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },

	-- split panes
	{
		key = "s",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- tab management
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
	},
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "r",
		mods = "CMD|ALT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- tab navigation
	{
		key = "l",
		mods = "CTRL|ALT",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},

	-- clipboard
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
}

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true

return config
