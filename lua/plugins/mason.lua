return {
    { 'neovim/nvim-lspconfig' },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ensure_installed = {
                    "sumneko_lua", "kotlin_language_server", -- Correct server name
                },
            })

            require('mason-lspconfig').setup({
                ensure_installed = { "kotlin-language-server" }, -- Install Lua and Kotlin LSP
            })
        end
    },
    {
        'williamboman/mason-lspconfig',
        dependencies = { 'mason.nvim' },
    },
    { 'mfussenegger/nvim-jdtls' },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
}
