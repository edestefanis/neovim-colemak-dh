return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local function my_on_attach(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- copy default mappings here from defaults in next section
                vim.keymap.set("n", "<C-d>", api.tree.change_root_to_node, opts("CD"))
                vim.keymap.set("n", "<C-u>", api.tree.change_root_to_parent, opts("Up"))
                vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
                ---
                -- OR use all default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- remove a default
                vim.keymap.del("n", "<C-]>", { buffer = bufnr })

                -- override a default
                vim.keymap.set("n", "<C-e>", api.tree.reload, opts("Refresh"))

                -- add your mappings
                vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
                vim.keymap.set("n", "r", api.fs.rename_basename, opts("Rename: Basename"))

                vim.keymap.set("n", "n", api.node.navigate.sibling.next, opts("Next Sibling"))
                vim.keymap.set("n", "e", api.node.navigate.sibling.prev, opts("Previous Sibling"))
                -- Colemak in NvimTree.
                local keymap = vim.keymap

                -- Unmap 'n' and 'N' in normal mode to disable their default search navigation
                keymap.set("n", "n", "", { silent = true }) -- Unmap 'n'
                keymap.set("n", "N", "", { silent = true }) -- Unmap 'N'

                -- Normal mode mappings
                keymap.set("n", "h", "n", { silent = true })
                keymap.set("n", "H", "N", { silent = true })
                keymap.set("n", "u", "i", { silent = true })
                keymap.set("n", "n", "j", { silent = true }) -- Remap 'n' to 'j'
                keymap.set("n", "e", "k", { silent = true })
                keymap.set("n", "i", "l", { silent = true })
                keymap.set("n", "m", "h", { silent = true })
                keymap.set("n", "z", "u", { silent = true })
                ---
                -- Visual mode mappings
                keymap.set("v", "u", "i", { silent = true })
                keymap.set("v", "n", "j", { silent = true })
                keymap.set("v", "e", "k", { silent = true })
                keymap.set("v", "i", "l", { silent = true })
                keymap.set("v", "m", "h", { silent = true })

                -- Operator-pending mode mappings
                keymap.set("o", "u", "i", { silent = true })
                keymap.set("o", "n", "j", { silent = true })
                keymap.set("o", "e", "k", { silent = true })
                keymap.set("o", "i", "l", { silent = true })
                keymap.set("o", "m", "h", { silent = true })
            end
            require("nvim-tree").setup {
                on_attach = my_on_attach,
                hijack_cursor = true, -- Keep the cursor focused on the current file
                update_focused_file = {
                    enable = true,    -- Automatically focus the current file in the tree
                },
            }
        end,

    },
}
