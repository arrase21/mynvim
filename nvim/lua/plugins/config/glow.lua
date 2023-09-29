--[[ return {

	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({
				style = "dark",
				-- width = 120,
				-- glow_path = "/home/arrase/.local/",
			})
		end,
		cmd = "Glow",
	},
} ]]

return {
	"iamcco/markdown-preview.nvim",
	run = "cd app && npm install",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
