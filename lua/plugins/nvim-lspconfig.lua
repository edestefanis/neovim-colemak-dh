return {
  -- Mason and Mason LSP config
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "ts_ls", "sumneko_lua", "kotlin_language_server", -- Correct server name
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = { "ts_ls", "kotlin-language-server" }, -- Install Lua and Kotlin LSP
      })
    end
  },
  { "williamboman/mason-lspconfig.nvim", config = true },
  { "prabirshrestha/vim-lsp",            config = true },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { "saghen/blink.cmp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "lvimuser/lsp-inlayhints.nvim", },

    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local mason = require("mason")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup()

      local mason_ensure_installed = vim.tbl_keys({})
      vim.list_extend(
        mason_ensure_installed,
        {
          "kotlin-language-server",
          "ts_ls",
        }
      )
      mason_tool_installer.setup({
        ensure_installed = mason_ensure_installed
      })
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")


      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local opts = { noremap = true, silent = true }

        buf_set_keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
        buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        client.server_capabilities.document_formatting = true
      end

      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          -- Disable formatting in tsserver, prefer null-ls/eslint
          client.server_capabilities.documentFormattingProvider = false
        end,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        settings = {
          javascript = {
            preferences = {
              importModuleSpecifier = "relative",
            },
          },
          typescript = {
            preferences = {
              importModuleSpecifier = "relative",
            },
          },
        },
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "rust" },
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      })
      lspconfig.lemminx.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)


      -- Lua LSP configuration
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      require('lspconfig').kotlin_language_server.setup({
        capabilities = capabilities,
        cmd = { "kotlin-language-server" },
        filetypes = { "kotlin" },
        root_dir = lspconfig.util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle",
          "build.gradle.kts", ".git", "packageInfo"),
        on_attach = function(client, bufnr)
          print("here3")
          print(vim.inspect(client.server_capabilities))
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          print("here4")
        end,
      })
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "<space>F", function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "<space>F", "<cmd>silent! !prettier --write %<cr>")
    end
  },
}
