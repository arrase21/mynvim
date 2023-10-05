return {
	"lukas-reineke/indent-blankline.nvim",
	commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
	event = { "BufReadPost", "BufNewFile" },
	-- main = "ibl",
	opts = {
		-- char = "▏",
		indent = {
			char = "│",
			priority = 2,
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
		show_trailing_blankline_indent = false,
		show_current_context = false,
	},
}
