return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			show_buffer_close_icons = false,
			always_show_bufferline = false,
			show_close_icon = false,
			numbers = "none",
			separator_style = "slant",
		},
		highlights = {
			separator = {
				fg = "#073642",
				bg = "#002b36",
			},
			separator_selected = {
				fg = "#073642",
			},
			background = {
				fg = "#657b83",
				bg = "#002b36",
			},
			buffer_selected = {
				fg = "#fdf6e3",
				bold = true,
			},
			fill = {
				bg = "#073642",
			},
		},
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {}),
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {}),
		vim.keymap.set("n", "<A-c>", "<Cmd>BufferLinePickClose<CR>", { desc = "bufferline: delete buffer" }),
	},
}
