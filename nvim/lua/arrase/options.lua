--[[ vim.opt.fileencoding = "utf-8"

vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.swapfile = false
vim.opt.conceallevel = 1

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.mouse = a
vim.opt.hlsearch = true
vim.opt.ignorecase = true

vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.signcolumn = "yes"

vim.opt.showtabline = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.scrolloff = 4 -- is one of my fav
vim.opt.sidescrolloff = 4

-- vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append({ "*/node_modules/*" })

vim.cmd("set clipboard+=unnamedplus") ]]

vim.cmd("set confirm")
local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 1,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showcmd = true,
	showtabline = 4,
	smartcase = true, -- smart case
	smartindent = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 100,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	signcolumn = "yes",
	wrap = true,
	scrolloff = 4, -- is one of my fav
	sidescrolloff = 4,
	ruler = false,
	guifont = "Iosevka Regular",
	-- foldmethod = "expr",
	foldmethod = "marker",
	-- foldexpr = "VimFolds(v:lnum)",
}
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.whichwrap:append("<,>,[,],h,l")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd [[set backspace=start,eol,indent]]
vim.cmd([[filetype plugin indent on]])
vim.cmd("set ai")
vim.cmd("set si")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd([[let g:OmniSharp_server_stdio = 1]])
