return {
	"rcarriga/nvim-notify",
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss all Notifications",
		},
	},
	opts = {
		background_colour = "#000000",
		timeout = 3000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
	},
	init = function()
		-- when noice is not enabled, install notify on VeryLazy
		local Util = require("lazyvim.util")
		if not Util.has("noice.nvim") then
			Util.on_very_lazy(function()
				vim.notify = require("notify")
			end)
		end
	end,
}

--[[ return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		-- this for transparency
		notify.setup({ background_colour = "#000000" })
		-- this overwrites the vim notify function
		vim.notify = notify.notify
	end,
} ]]
