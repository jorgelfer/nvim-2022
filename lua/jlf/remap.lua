local nnoremap = require("jlf.keymap").nnoremap
local tnoremap = require("jlf.keymap").tnoremap
local inoremap = require("jlf.keymap").inoremap
local nmap = require("jlf.keymap").nmap

nnoremap("<leader>pv", "<cmd>Ex<CR>") 

-- split manipulation
nnoremap("<C-J>", "<C-W><C-J>") 
nnoremap("<C-K>", "<C-W><C-K>") 
nnoremap("<C-L>", "<C-W><C-L>") 
nnoremap("<C-H>", "<C-W><C-H>") 
nnoremap("N", "<cmd>vertical resize +3<cr>")
nnoremap("M", "<cmd>vertical resize -3<cr>")

-- remap for vim fugitive
nnoremap("<leader>s", "<cmd>G<CR>") 

-- remap for telescope
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- remap for quick accesing vim config
nnoremap("<leader>v", "<cmd>exe 'edit '.stdpath('config').'/lua/jlf/lspconfig.lua'<cr>")

-- terminal remaps
-- tnoremap("<Esc>", "<C-\><C-n>")
-- tnoremap("<A-h>", "<C-\><C-N><C-w>h")
-- tnoremap("<A-j>", "<C-\><C-N><C-w>j")
-- tnoremap("<A-k>", "<C-\><C-N><C-w>k")
-- tnoremap("<A-l>", "<C-\><C-N><C-w>l")
-- inoremap("<A-h>", "<C-\><C-N><C-w>h")
-- inoremap("<A-j>", "<C-\><C-N><C-w>j")
-- inoremap("<A-k>", "<C-\><C-N><C-w>k")
-- inoremap("<A-l>", "<C-\><C-N><C-w>l")
nnoremap("<A-h>", "<C-W>h")
nnoremap("<A-j>", "<C-W>j")
nnoremap("<A-k>", "<C-W>k")
nnoremap("<A-l>", "<C-W>l")
