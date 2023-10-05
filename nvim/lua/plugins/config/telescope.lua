return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			return
		end

		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		telescope.setup({
			defaults = {
				prompt_prefix = "🔎 ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = {
					".git/",
					"target/",
					"docs/",
					"vendor/*",
					"%.lock",
					"__pycache__/*",
					"%.sqlite3",
					"%.ipynb",
					"node_modules/*",
					-- "%.jpg",
					-- "%.jpeg",
					-- "%.png",
					"%.svg",
					"%.otf",
					"%.ttf",
					"%.webp",
					".dart_tool/",
					".github/",
					".gradle/",
					".idea/",
					".settings/",
					".vscode/",
					"__pycache__/",
					"build/",
					"env/",
					"gradle/",
					"node_modules/",
					"%.pdb",
					"%.dll",
					"%.class",
					"%.exe",
					"%.cache",
					"%.ico",
					"%.pdf",
					"%.dylib",
					"%.jar",
					"%.docx",
					"%.met",
					"smalljre_*/*",
					".vale/",
					"%.burp",
					"%.mp4",
					"%.mkv",
					"%.rar",
					"%.zip",
					"%.7z",
					"%.tar",
					"%.bz2",
					"%.epub",
					"%.flac",
					"%.tar.gz",
				},

				mappings = {
					n = {
						["q"] = actions.close,
						["dd"] = require("telescope.actions").delete_buffer,
						["?"] = actions.which_key,
					},
				},
			},
			pickers = {
				live_grep = {
					theme = "dropdown",
					previewer = true,
				},
				grep_string = {
					theme = "dropdown",
				},
				find_files = {
					theme = "dropdown",
					previewer = true,
				},
				oldfiles = {
					theme = "dropdown",
					previewer = true,
				},

				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
				},
				planets = {
					show_pluto = true,
					show_moon = true,
				},
				colorscheme = {
					-- enable_preview = true,
				},
				lsp_references = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_definitions = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_declarations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_implementations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
			},
			extensions = {
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg" },
					find_cmd = "rg", -- find command (defaults to `fd`)
				},
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					prompt_prefix = "🔎 ",
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_cursor({
						-- even more opts
					}),
				},
			},
		})
		telescope.load_extension("file_browser")
		vim.keymap.set("n", ";f", function()
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end)
		vim.keymap.set("n", "\\\\", function()
			builtin.buffers()
		end)
		vim.keymap.set("n", ";t", function()
			builtin.help_tags()
		end)
		vim.keymap.set("n", ";;", function()
			builtin.resume()
		end)
		vim.keymap.set("n", ";e", function()
			builtin.diagnostics()
		end)
		vim.keymap.set("n", "sf", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				--cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end)
		require("telescope").load_extension("ui-select")
		vim.api.nvim_set_keymap("n", "<Leader><CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>gr", "<cmd>Telescope lsp_references<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>gs", "<cmd>Telescope git_status<CR>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<Leader>sd", "<cmd>Telescope diagnostics<CR>", { noremap = true })
	end,
}
