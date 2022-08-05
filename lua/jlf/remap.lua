local nnoremap = require("jlf.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>") 

-- split manipulation remaps
nnoremap("<C-J>", "<C-W><C-J>") 
nnoremap("<C-K>", "<C-W><C-K>") 
nnoremap("<C-L>", "<C-W><C-L>") 
nnoremap("<C-H>", "<C-W><C-H>") 

-- remap for vim fugitive
nnoremap("<leader>gs", "<cmd>G<CR>") 
