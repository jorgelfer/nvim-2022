local nnoremap = require("jlf.keymap").nnoremap
local tnoremap = require("jlf.keymap").tnoremap
local inoremap = require("jlf.keymap").inoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>") 

-- split manipulation
nnoremap("<C-J>", "<C-W><C-J>") 
nnoremap("<C-K>", "<C-W><C-K>") 
nnoremap("<C-L>", "<C-W><C-L>") 
nnoremap("<C-H>", "<C-W><C-H>") 

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
nnoremap("<A-h>", "<C-W>h")
nnoremap("<A-j>", "<C-W>j")
nnoremap("<A-k>", "<C-W>k")
nnoremap("<A-l>", "<C-W>l")

-- remaps for dap
nnoremap("<F5>", "<cmd>lua require('dap').continue()<CR>")
nnoremap("<F10>", "<cmd>lua require('dap').step_over()<CR>")
nnoremap("<F11>", "<cmd>lua require('dap').step_into()<CR>")
nnoremap("<F12>", "<cmd>lua require('dap').step_out()<CR>")
nnoremap("<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
nnoremap("<F5>", "<cmd>lua require('dap').repl.open()<CR>")
