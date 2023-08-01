require("neo-tree").setup({
	close_if_last_window = false,
	enable_git_status = false,
	enable_diagnostics = false,
	enable_normal_mode_for_inputs = false,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
	sort_case_insensitive = true,
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 0,
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			with_expanders = nil,
			expander_collapsed = "+",
			expander_expanded = "-",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = false,
			highlight = "NeoTreeFileName",
		},
	},
	commands = {},
	window = {
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<cr>"] = "toggle_node",
			["<esc>"] = "cancel",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["o"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["a"] = {
				"add",
				config = {
					show_path = "relative"
				}
			},
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["p"] = "paste_from_clipboard",
			["c"] = {
				"copy",
				config = {
					show_path = "relative"
				}
			},
			["m"] = "move",
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
		}
	},
	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true,
			hide_by_name = {
				"node_modules"
			},
			hide_by_pattern = {},
			always_show = {},
			never_show = {},
			never_show_by_pattern = {},
		},
		follow_current_file = {
			enabled = false,
			leave_dirs_open = false,
		},
		group_empty_dirs = false,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = false,
		window = {
			mappings = {},
			fuzzy_finder_mappings = {},
		},
		commands = {}
	},
	buffers = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		group_empty_dirs = true,
		show_unloaded = true,
		window = { mappings = {} },
	},
})

vim.api.nvim_set_keymap("n", "<Leader>l", ":Neotree toggle<CR>", { silent = true });
