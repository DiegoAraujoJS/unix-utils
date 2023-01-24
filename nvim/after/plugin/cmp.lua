local status, cmp             = pcall(require, 'cmp')
local status_luasnip, luasnip = pcall(require, 'luasnip')
local status_lspkind, lspkind = pcall(require, 'lspkind')
if not status or not status_luasnip then
    return nil
end

local formatting = function() end

if status_lspkind then
    formatting = lspkind.cmp_format({
        with_text = true,
        menu = {
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            luasnip = "[snip]"
        }
    })
end

cmp.setup {
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    formatting = {
        format = formatting,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
}
