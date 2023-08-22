return {
	"glepnir/lspsaga.nvim",

	config = function()
		local status_saga_ok, saga = pcall(require, "lspsaga")
		if not status_saga_ok then
			return
		end
		local keymap = vim.keymap.set
		saga.setup({
			ui = {
				-- code_action = "💡",
				winblend = 10,
				border = "rounded",
				colors = {
					normal_bg = "#002b36",
				},
				kind = {},
			},
		})

		keymap("n", "<A-g>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		-- keymap('n', '<leader>l', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
		keymap("n", "gl", "<Cmd>Lspsaga show_line_diagnostic<CR>", opts)
		keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		keymap("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
		keymap("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
		-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
		keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		keymap("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		keymap("n", "rn", "<Cmd>Lspsaga rename<CR>", opts)

		-- code action
		keymap("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)
		-- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
		--
	end,
}
