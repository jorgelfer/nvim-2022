local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = { "vim","cpp", "c", "python", "lua", "julia" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    highlight = {
        enable = true
    }
}
