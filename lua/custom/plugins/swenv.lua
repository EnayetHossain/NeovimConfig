return {
  "AckslD/swenv.nvim",
  config = function()
    local swenv = require("swenv")

    swenv.setup({
      venvs_path = vim.fn.getcwd(),
      post_set_venv = function()
        vim.cmd("LspRestart")
      end,
    })

    -- 🔧 Register the :SwenvInfo command correctly
    vim.api.nvim_create_user_command("SwenvInfo", function()
      local api = require("swenv.api")
      local venv = api.get_current_venv()
      if venv then
        vim.notify("Current virtualenv: " .. venv.name, vim.log.levels.INFO)
      else
        vim.notify("No virtual environment selected", vim.log.levels.WARN)
      end
    end, {})
  end,

  keys = {
    { "<leader>vs", "<cmd>lua require('swenv.api').pick_venv()<CR>", desc = "Select VirtualEnv" },
    { "<leader>vi", "<cmd>SwenvInfo<CR>", desc = "Show Current VirtualEnv" },
  },
}
