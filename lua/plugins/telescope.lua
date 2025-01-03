return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
     {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      }
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            "node_modules", -- Exclude node_modules
            "build",        -- Exclude build directories
            "env",        -- Exclude build directories
            "%.lock",       -- Exclude lock files
            "%.class",      -- Exclude compiled Java class files
          },
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key",
              ["<C-d>"] = require('telescope.actions').delete_buffer
            },
            n = {
              ["<C-d>"] = require('telescope.actions').delete_buffer
            }
          }
        },
        pickers = {
          find_files = {
            theme = "ivy"
          },
          live_grep = {
            theme = "ivy"
          },
        },
        extensions = {
          extensions = {
            fzf = {
              fuzzy = true,                   -- Enable fuzzy search
              override_generic_sorter = true, -- Override generic sorter
              override_file_sorter = true,    -- Override file sorter
              case_mode = "smart_case",       -- Case modes: "ignore_case", "smart_case", "respect_case"
            }
          }
        }
      }
      require('telescope').load_extension('fzf')
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>en', function() builtin.find_files { cwd = vim.fn.stdpath("config") } end,
        { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>ep',
        function() builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") } end,
        { desc = 'Telescope help tags' })
    end
  }
}
