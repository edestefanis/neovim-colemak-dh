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
            end
            require("nvim-tree").setup {
                hijack_cursor = true, -- Keep the cursor focused on the current file
                update_focused_file = {
                    enable = true,    -- Automatically focus the current file in the tree
                },
                on_attach = my_on_attach,
            }
        end,

    },
}
