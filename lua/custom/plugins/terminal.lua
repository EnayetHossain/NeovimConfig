return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<C-\>]], -- Key to toggle terminal
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false, -- <--- ABSOLUTELY ESSENTIAL: Set this to false
    -- shading_factor = 2, -- No longer relevant if shade_terminals is false
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal", -- Can be "vertical" or "float"
    close_on_exit = true,
    shell = "pwsh", -- Set to PowerShell; use "powershell.exe" if on older systems
    float_opts = {
      border = "curved",
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
    local Terminal = require('toggleterm.terminal').Terminal

    vim.keymap.set("n", "<leader>gg", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle Terminal" })
    vim.keymap.set("t", "<leader>gg", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle Terminal" })

    -- Example: PowerShell terminal setup
    local powershell = Terminal:new({ cmd = "pwsh", hidden = true })
    function _POWERSHELL_TOGGLE()
      powershell:toggle()
    end
    vim.keymap.set("n", "<leader>sh", "<cmd>lua _POWERSHELL_TOGGLE()<CR>", { desc = "Open PowerShell" })
  end,
}
