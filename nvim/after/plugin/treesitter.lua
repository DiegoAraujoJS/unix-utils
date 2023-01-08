local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end
treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "vim", "lua", "help", "javascript", "typescript", "php" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        disable = { "javascript" },

        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true
    }
}