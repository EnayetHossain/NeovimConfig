return {
  'nvim-tree/nvim-tree.lua',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    view = {
      side = "left",
      width = 30,
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
    actions = {
      open_file = {
        quit_on_open = false,
      },
    },
  },
  config = function(_, opts)
    require('nvim-tree').setup(opts)
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
  end,
}
