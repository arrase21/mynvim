--[[ return {
	"arrase21/yiyi.nvim",
	-- "svrana/neosolarized.nvim",
	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},
	config = function()
		local status, n = pcall(require, "yiyi")
		-- local status, n = pcall(require, "neosolarized")
		if not status then
			return
		end
		n.setup({
			comment_italics = true,
		})
		local cb = require("colorbuddy.init")
		local Color = cb.Color
		local colors = cb.colors
		local Group = cb.Group
		local groups = cb.groups
		local styles = cb.styles
		Color.new("black", "#000000")
		Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
		Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
		Group.new("Visual", colors.none, colors.base03, styles.reverse)
		local cError = groups.Error.fg
		local cInfo = groups.Information.fg
		local cWarn = groups.Warning.fg
		local cHint = groups.Hint.fg
		Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
		Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
		Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
		Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
		Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
		Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
		Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
		Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
	end,
} ]]

return {
	"arrase21/dracula.nvim",
	config = function()
		vim.cmd(
			[[colorscheme dracula ]]

			-- "hi Normal guibg=none ctermbg=none
			-- "hi LineNr guibg=NONE ctermbg=NONE
			-- "hi EndOfBuffer guibg=NONE ctermbg=NONE
			-- "let g:dracula_colorterm = 1
		)
		local dracula = require("dracula")
		dracula.setup({
			-- customize dracula color palette
			colors = {
				bg = "#282A36",
				fg = "#F8F8F2",
				comment = "#6272A4",
				selection = "#44475A",
				red = "#FF5555",
				orange = "#FFB86C",
				yellow = "#F1FA8C",
				green = "#50fa7b",
				purple = "#BD93F9",
				cyan = "#8BE9FD",
				pink = "#FF79C6",
				bright_red = "#FF6E6E",
				bright_green = "#69FF94",
				bright_yellow = "#FFFFA5",
				bright_blue = "#D6ACFF",
				bright_magenta = "#FF92DF",
				bright_cyan = "#A4FFFF",
				bright_white = "#FFFFFF",
				menu = "#21222C",
				visual = "#3E4452",
				gutter_fg = "#4B5263",
				nontext = "#3B4048",
				white = "#ABB2BF",
				black = "#191A21",
			},
			show_end_of_buffer = true, -- default false
			transparent_bg = true, -- default false
			lualine_bg_color = "#44475a", -- default nil
			italic_comment = true, -- default false
			overrides = {},
		})
	end,
}
