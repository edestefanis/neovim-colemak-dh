return {
  {
    'preservim/nerdtree'
  },
  {
    'ryanoasis/vim-devicons',
    config = function()
      -- Optional: Set global variables for VimDevIcons customization
      vim.g.webdevicons_enable = 1             -- Enable VimDevIcons
      vim.g.webdevicons_enable_nerdtree = 1    -- Enable icons in NERDTree
      vim.g.DevIconsEnableFoldersOpenClose = 1 -- Show icons for folder open/close states
      vim.opt.termguicolors = true             -- Enable TrueColor support in Neovim
    end
  },
  {
    'preservim/nerdtree'
  },
  {
    'Xuyuanp/nerdtree-git-plugin'
  },
  {
    'tiagofumo/vim-nerdtree-syntax-highlight',
    config = function()
      vim.g.NERDTreeFileExtensionHighlightFullName = 1
      vim.g.NERDTreeExactMatchHighlightFullName = 1
      vim.g.NERDTreePatternMatchHighlightFullName = 1
      vim.g.NERDTreeHighlightFolders = 1
      vim.g.NERDTreeHighlightFoldersFullName = 1
    end
  }
}
