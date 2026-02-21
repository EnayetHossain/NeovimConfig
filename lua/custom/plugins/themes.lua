return {
  {
    "rose-pine/neovim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
      vim.cmd.hi("Comment gui=none")
    end,
  },
  -- onedark
  { "navarasu/onedark.nvim",    lazy = false,        priority = 1000, },

  -- Catppuccin
  { "catppuccin/nvim",          name = "catppuccin", lazy = false,    priority = 1000, },

  -- Gruvbox
  { "ellisonleao/gruvbox.nvim", lazy = false,        priority = 1000, },

  -- Nord
  { "shaunsingh/nord.nvim",     lazy = false,        priority = 1000, },

  -- Solarized
  { "maxmx03/solarized.nvim",   lazy = false,        priority = 1000, },

  -- tokyonight
  { "folke/tokyonight.nvim",    lazy = false,        priority = 1000, },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false }
  }
}
