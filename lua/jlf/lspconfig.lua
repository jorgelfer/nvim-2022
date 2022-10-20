local nvim_lsp = require('lspconfig')
local servers = {'pylsp'}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>h', vim.diagnostic.hide, opts)
vim.keymap.set('n', '<leader>s', vim.diagnostic.show, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
  virtual_text = false, -- no inline msn
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', 'gj', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- specific for pylsp
local settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 200
        }
      }
    }
}

for _, lsp in ipairs(servers) do

    -- define configuratios
    nvim_lsp[lsp].setup{
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
        settings = settings
    }
end


-- nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- better autocompletion experience
vim.o.completeopt = 'menuone,noselect'

cmp.setup {
	-- Format the autocomplete menu
	formatting = {
		format = lspkind.cmp_format()
	},
	mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
