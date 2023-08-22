--[[ return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/playground",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "http", "php", "python", "css", "todotxt", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			highlight = {
				enable = true, -- false will disable the whole extension
				additional_vim_regex_highlighting = true,
				disable = {},
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
				config = {
					typescript = "// %s",
					css = "/* %s */",
					scss = "/* %s */",
					html = "<!-- %s -->",
					svelte = "<!-- %s -->",
					vue = "<!-- %s -->",
					json = "",
				},
			},
			indent = { enable = true, disable = { "python" } },
			autotag = { enable = true },
			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = false, -- Whether the query persists across vim sessions
				keybindings = {
					oggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
			rainbow = {
				enable = true,
				extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
				max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
				disable = {},
			},
		})
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
} ]]

return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				-- disable rtp plugin, as we only need its queries for mini.ai
				-- In case other textobject modules are enabled, we will load them
				-- once nvim-treesitter is loaded
				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				load_textobjects = true
			end,
		},
	},
	cmd = { "TSUpdateSync" },
	keys = {
		{ "<c-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Decrement selection", mode = "x" },
	},
	---@type TSConfig
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	---@param opts TSConfig
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)

		if load_textobjects then
			-- PERF: no need to load the plugin, if we only need its queries for mini.ai
			if opts.textobjects then
				for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
					if opts.textobjects[mod] and opts.textobjects[mod].enable then
						local Loader = require("lazy.core.loader")
						Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
						local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
						require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
						break
					end
				end
			end
		end
	end,
}
