local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)
keymap("i", "KJ", "<ESC>", opts)

-- Quit
keymap("n", "<Leader>w", ":w<ESC>", opts)
-- keymap("n", "<Leader>q", ":quitall<ESC>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

keymap("i", "<A-k> <esc>", ":m .+1<CR>==gi", opts)
keymap("i", "<A-k> <esc>", ":m .-2<CR>==gi", opts)

-- Delete word
keymap("n", "<backspace>", "diw", opts)

-- Copy paste
keymap("n", "<Leader>y", "mzyyp`zj", opts)

-- keymap("n", "<leader>s", ":split<Return>", opts)
keymap("n", "<leader>v", ":vsplit<Return><C-w>w", opts)

keymap("n", "<leader>s", ":term python % <CR>", opts)
keymap("n", "<leader>s", ":term node % <CR>", opts)
