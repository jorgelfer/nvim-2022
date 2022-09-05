-- number of spaces in tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- user color in the terminal
vim.opt.termguicolors = true

-- enable autoindents
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

-- add line numbers and relative numbers    
vim.opt.nu = true
vim.opt.relativenumber = true

-- highlight the matched text pattern with searching
vim.opt.hlsearch = true 
vim.opt.incsearch = true

-- navigate buffers without lossing unsaved work
vim.opt.hidden = true

-- save undo history
vim.opt.undofile = true

vim.opt.guicursor = ""
vim.opt.wrap = false
vim.g.mapleader = " "

-- noerror bells and no backup
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false

-- clipboard support
vim.opt.clipboard = "unnamedplus"

-- encoding
vim.opt.encoding = 'utf8'
vim.opt.guifont = "Agave:h11"
