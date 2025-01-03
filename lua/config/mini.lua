
require("mini").setup({
        config = function()
            require("mini.ai").setup()    -- Text objects
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
