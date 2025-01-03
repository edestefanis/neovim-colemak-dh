return {
    {
        "echasnovski/mini.nvim",
        version = "*", -- Use the latest stable version
        config = function()
            require("mini.ai").setup({
                -- No need to copy this inside `setup()`. Will be used automatically.
                {
                    -- Table with textobject id as fields, textobject specification as values.
                    -- Also use this to disable builtin textobjects. See |MiniAi.config|.
                    custom_textobjects = nil,

                    -- Module mappings. Use `''` (empty string) to disable one.
                    mappings = {
                        -- Main textobject prefixes
                        around = 'a',
                        inside = 'i',

                        -- Next/last variants
                        around_next = 'an',
                        inside_next = 'in',
                        around_last = 'al',
                        inside_last = 'il',

                        -- Move cursor to corresponding edge of `a` textobject
                        goto_left = 'g[',
                        goto_right = 'g]',
                    },

                    -- Number of lines within which textobject is searched
                    n_lines = 50,

                    -- How to search for object (first inside current line, then inside
                    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
                    -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
                    search_method = 'cover_or_next',

                    -- Whether to disable showing non-error feedback
                    -- This also affects (purely informational) helper messages shown after
                    -- idle time if user input is required.
                    silent = false,
                }
            })                            -- Text objects
            require("mini.align").setup() -- Alignment
            require("mini.bufremove").setup() -- Buffer removal
            require("mini.comment").setup() -- Commenting
            require("mini.cursorword").setup() -- Word highlighting
            require("mini.files").setup() -- File explorer
            require("mini.fuzzy").setup() -- Fuzzy matching
            require("mini.hipatterns").setup() -- Highlight patterns
            require("mini.indentscope").setup() -- Indent visualization
            require("mini.jump").setup()  -- Smart jumping
            require("mini.map").setup()   -- Code minimap
            require("mini.pairs").setup() -- Auto-pairing
            require("mini.sessions").setup() -- Session management
            require("mini.statusline").setup() -- Statusline
            require("mini.surround").setup() -- Surround text manipulation
            require("mini.tabline").setup() -- Tabline
            require("mini.trailspace").setup() -- Trailing whitespace
        end,
    },
}

