local lsp_zero = require('lsp-zero')
--local navic = require('nvim-navic')
--local navbuddy = require('nvim-navbuddy')
local mason = require('mason-registry')

function bemol()
    local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
        if file then
            for line in file:lines() do
                table.insert(ws_folders_lsp, line)
            end
            file:close()
        end
    end

    for _, line in ipairs(ws_folders_lsp) do
        vim.lsp.buf.add_workspace_folder(line)
    end
end

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- goto definition
    --vim.keymap.set("n", "gs", function() navbuddy.open() end, opts)
    vim.keymap.set("n", "H", function() vim.lsp.buf.hover() end, opts)
    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts) -- find all references
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)    -- rename symbol
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    bemol()
end)

local util = require("lspconfig.util")

require('mason').setup({})
local jdtls_install_dir = mason.get_package("jdtls"):get_install_path()

require('mason-lspconfig').setup({
    ensure_installed = { 'jdtls', 'kotlin_language_server' },
    handlers = {
        lsp_zero.default_setup,
        --denols = require('lspconfig').denols.setup({
        --    on_attach = function(client, bufnr)
        --        bemol()
        --    end,
        --}),
        --ra = require('lspconfig').rust_analyzer.setup({
        --    on_attach = on_attach,
        --    cmd = {
        --        "/home/samgolde/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer",

        --    },
        --}),
        kls = require('lspconfig').kotlin_language_server.setup({
            filetypes = { "kotlin" },
            root_dir = util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts",
                ".git", "packageInfo"),
            init_options = {
                storagePath = "/Users/ericdes/.ktserverdata"
            }
        }),
        jdtls = function()
            require('lspconfig').jdtls.setup({
                on_attach = function(client, bufnr)
                    bemol()
                end,
                cmd = {
                    "jdtls",
                    "--jvm-arg=-javaagent:"
                    .. jdtls_install_dir .. "/lombok.jar",
                },
            })
        end,
        require 'lspconfig'.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        version = 'LuaJIT',
                        -- Setup Neovim runtime path
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
    }
})
