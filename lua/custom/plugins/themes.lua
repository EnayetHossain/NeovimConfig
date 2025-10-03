return {
-- onedark
  {"navarasu/onedark.nvim", lazy = false, priority = 1000, transparent = true},

  -- Catppuccin
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000, transparent = true },

  -- Gruvbox
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000, transparent = true },

  -- Nord
  { "shaunsingh/nord.nvim", lazy = false, priority = 1000, transparent = true },

  -- Solarized
  { "maxmx03/solarized.nvim", lazy = false, priority = 1000, transparent = true },

  -- tokyonight
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, transparent = true },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
