-- Mappingit

mapleader = " "

vim.keymap.set("n", "<Leader>t", '<cmd>echo --Hello World"<cr>')
-- Functions

-- Insert mode
vim.keymap.set("i", "jk", "<esc>")

function mapAll(key, command)
	vim.keymap.set("n", key, command, { noremap = true })
	vim.keymap.set("i", key, "<C-o>" .. command, { noremap = true })
	vim.keymap.set("s", key, "<esc><C-o>" .. command, { noremap = true })
end

function mapAllIndent(key, command)
	vim.keymap.set("n", key, command, { noremap = true })
	vim.keymap.set("i", key, "<C-o>" .. command, { noremap = true })
	vim.keymap.set("s", key, "<C-o>" .. command, { noremap = true })
end

-- Misc plugins

-- Autoclose
mapAll("<A-a>", ":AutoCloseToggle<CR>")

-- = Buffkill

-- Delete buffer but leave windows/split intact:
vim.keymap.set("n", "<Leader>bd", ":BD<CR>")

-- wipe a file from the buffer and keep the window/split intact:
vim.keymap.set("n", "<Leader>bw", ":BW<CR>")

-- = Colorizer
vim.keymap.set("n", "<Leader>ch", ":ColorHighlight<CR>")
vim.keymap.set("n", "<Leader>cc", ":ColorClear<CR>")
vim.keymap.set("n", "<Leader>ct", ":ColorToggle<CR>")

-- = FZF

vim.keymap.set("n", "<C-p>", ":Files<CR>")

-- M = Most recent used
vim.keymap.set("n", "<Leader>m", ":History<CR>")

vim.keymap.set("v", "<Leader>b", ":Buffers<CR>")

-- = Gnvim
-- inoremap <expr> <C-A-i> gnvim#completion_menu_toggle_info()

-- = NERDTree
-- vim.keymap.set('n', <Leader>n :NERDTreeToggle<CR>
-- call MapAll('<C-b>',':NERDTreeToggle<CR>')

-- = Vim-Wiki

-- '+' is used to add single characters in my config.
-- nmap ++ <Plug>VimwikiNormalizeLink
-- vmap ++ <Plug>VimwikiNormalizeLinkVisual

-- Show links and not just their name etc.
vim.keymap.set("n", "<leader>h", "ConcealToggle()<cr>")

mapAll("<C-b>", ":NERDTreeToggle<CR>")
