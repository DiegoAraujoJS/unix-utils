local nnoremap = require("diego.keymap").nnoremap
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return nil
end
local util = require("lspconfig/util")

local function keymaps(_, bufnr)
    local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }
    nnoremap("<leader>h", vim.lsp.buf.hover, bufopts)
    nnoremap("gD", vim.lsp.buf.declaration, bufopts)
    nnoremap("gd", vim.lsp.buf.definition, bufopts)
    nnoremap("<leader>a", vim.lsp.buf.document_highlight, bufopts)
    nnoremap("g[", vim.diagnostic.goto_next, bufopts)
    nnoremap("g]", vim.diagnostic.goto_prev, bufopts)
    nnoremap("gt", vim.lsp.buf.type_definition, bufopts)
end

local function highlighting(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        print("has highlighting")
        local highlighted = false
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                if not highlighted then
                    vim.schedule(vim.lsp.buf.document_highlight)
                    highlighted = true
                end
            end,
            buffer = bufnr,
            group = vim.api.nvim_create_augroup("LspDocumentHighlight", {})
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = function()
                if highlighted then
                    vim.schedule(vim.lsp.buf.clear_references)
                    highlighted = false
                end
            end,
            buffer = bufnr,
            group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })
        })
    end
end

local function formatting(client, bufnr)
    if client.server_capabilities.documentFormattingProvider and
        (vim.bo.filetype ~= "javascript" and vim.bo.filetype ~= "php") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.formatting_seq_sync()
            end,
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
        })
    end
end

local function lsp_handlers()
    vim.lsp.handlers["textDocument/signaturehelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        focusable = true,
        style = "minimal",
        border = "rounded"
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    })
end

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.server_capabilities.definitionProvider then
        print("has definition provider")
        vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    print("lsp server active")

    -- add server capabilities handlers
    highlighting(client, bufnr)
    formatting(client, bufnr)

    -- keymaps and other
    lsp_handlers()
    keymaps(client, bufnr)
end

local capabilities
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status then
    capabilities = cmp_nvim_lsp.default_capabilities()
else
    capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
end

local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    },
}

local servers = {
    pyright = {
        analysis = {
            typeCheckingMode = true,
        }
    },
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "use" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                }
            }
        }
    },
    gopls = {
        cmd = { "gopls", "serve" },
        filetypes = { "go", "gomod" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true
                },
                staticcheck = true
            }
        }
    },
    tsserver = {
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
    },
    volar = {
        filetypes = { "vue" }
    },
    omnisharp = {
        cmd = { "dotnet", "/home/diego/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },
    },
    dockerls = {},
    jsonls = {},
    bashls = {},
    intelephense = {},
    vimls = {},
    tailwindcss = {},
}

for server_name, _ in pairs(servers) do
    local extended_opts = vim.tbl_deep_extend("force", opts, servers[server_name] or {})
    nvim_lsp[server_name].setup(extended_opts)
end
