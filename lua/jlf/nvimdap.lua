local nnoremap = require("jlf.keymap").nnoremap
local vnoremap = require("jlf.keymap").vnoremap
require('dap-python').setup()


-- remaps for dap
nnoremap("<F5>", "<cmd>lua require('dap').continue()<CR>")
nnoremap("<F10>", "<cmd>lua require('dap').step_over()<CR>")
nnoremap("<F11>", "<cmd>lua require('dap').step_into()<CR>")
nnoremap("<F12>", "<cmd>lua require('dap').step_out()<CR>")
nnoremap("<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
nnoremap("<leader>B", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

-- not sure what this is for
nnoremap("<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
nnoremap("<leader>ee", "<cmd>lua require('dap').terminate()<CR>")
nnoremap("<leader>dm", "<cmd>lua require('dap_python').test_method()<CR>")
nnoremap("<leader>dc", "<cmd>lua require('dap_python').test_class()<CR>")


local dap, dapui = require("dap"), require("dapui")
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- hover
-- nnoremap("<leader><CR>", "<cmd>lua require('dapui.variables').hover()<CR>")
-- vnoremap("<leader><CR>", "<cmd>lua require('dapui.variables').visual_hover()<CR>")
nnoremap("<leader><CR>", "<cmd>lua require('dapui').eval()<CR>")
vnoremap("<leader><CR>", "<cmd>lua require('dapui').eval()<CR>")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
