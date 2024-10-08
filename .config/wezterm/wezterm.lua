local k = require("utils/keys")
local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("cmd_w_keybinding", function(window, pane)
	local success, foreground_process_name, stderr = wezterm.run_child_process({ "/Users/swilliams/bin/tmux-title" })

	if foreground_process_name:match("vim") then
		-- Send the ":bd" command to Vim
		window:perform_action(wezterm.action({ SendString = ":bd\n" }), pane)
	else
		-- Send the tmux prefix (e.g., Ctrl-B) followed by 'x'
		window:perform_action(wezterm.action({ SendKey = { key = "a", mods = "CTRL" } }), pane)
		window:perform_action(wezterm.action({ SendString = "x" }), pane)
	end
end)

return {

	-- padding
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- general options
	term = "tmux-256color",
	adjust_window_size_when_changing_font_size = false,
	debug_key_events = true,
	enable_tab_bar = false,
	native_macos_fullscreen_mode = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
	font_size = 13.0,
	scrollback_lines = 1500,
	enable_scroll_bar = false,

	keys = {
		k.cmd_key("[", act.SendKey({ mods = "CTRL", key = "o" })),
		k.cmd_key("]", act.SendKey({ mods = "CTRL", key = "i" })),
		k.cmd_key("f", k.multiple_actions(":Grep")),
		k.cmd_key("i", k.multiple_actions(":SmartGoTo")),
		k.cmd_key("p", k.multiple_actions(":GoToFile")),
		k.cmd_key("P", k.multiple_actions(":GoToCommand")),
		k.cmd_key("q", k.multiple_actions(":qa!")),
		-- k.cmd_key("w", k.multiple_actions(":bd")),
		{ key = "w", mods = "CMD", action = wezterm.action({ EmitEvent = "cmd_w_keybinding" }) },

		k.cmd_to_tmux_prefix("0", "1"),
		k.cmd_to_tmux_prefix("1", "1"),
		k.cmd_to_tmux_prefix("2", "2"),
		k.cmd_to_tmux_prefix("3", "3"),
		k.cmd_to_tmux_prefix("4", "4"),
		k.cmd_to_tmux_prefix("5", "5"),
		k.cmd_to_tmux_prefix("6", "6"),
		k.cmd_to_tmux_prefix("7", "7"),
		k.cmd_to_tmux_prefix("8", "8"),
		k.cmd_to_tmux_prefix("9", "9"),

		k.cmd_to_tmux_prefix("`", "n"),
		k.cmd_to_tmux_prefix("b", "B"),
		k.cmd_to_tmux_prefix("C", "C"),
		k.cmd_to_tmux_prefix("d", "D"),
		k.cmd_to_tmux_prefix("E", "%"),
		k.cmd_to_tmux_prefix("e", '"'),
		k.cmd_to_tmux_prefix("G", "G"),
		k.cmd_to_tmux_prefix("g", "g"),
		k.cmd_to_tmux_prefix("n", "|"),
		k.cmd_to_tmux_prefix("N", "-"),
		k.cmd_to_tmux_prefix("o", "u"),
		k.cmd_to_tmux_prefix("T", "!"),
		k.cmd_to_tmux_prefix("t", "c"),
		-- k.cmd_to_tmux_prefix("w", "x"),
		k.cmd_to_tmux_prefix("z", "z"),

		k.cmd_key(
			"R",
			act.Multiple({
				act.SendKey({ key = "\x1b" }), -- escape
				k.multiple_actions(":source %"),
			})
		),

		k.cmd_key(
			"s",
			act.Multiple({
				act.SendKey({ key = "\x1b" }), -- escape
				k.multiple_actions(":w"),
			})
		),

		{
			mods = "CMD|SHIFT",
			key = "}",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "a" }),
				act.SendKey({ key = "n" }),
			}),
		},
		{
			mods = "CMD|SHIFT",
			key = "{",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "a" }),
				act.SendKey({ key = "p" }),
			}),
		},

		{
			mods = "CTRL",
			key = "Tab",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "a" }),
				act.SendKey({ key = "n" }),
			}),
		},

		{
			mods = "CTRL|SHIFT",
			key = "Tab",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "a" }),
				act.SendKey({ key = "p" }),
			}),
		},

		{
			mods = "CMD",
			key = "~",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = "a" }),
				act.SendKey({ key = "p" }),
			}),
		},
	},
}
