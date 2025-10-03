_G.transparent_enabled = false
_G.original_highlights = {}

-- Save the original background colors at startup
local function save_original_bg(group)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  _G.original_highlights[group] = hl.bg or "NONE"
end

local function save_all_original_bgs()
  local groups = {
  "Normal", "NormalNC", "NormalFloat", "FloatBorder", "VertSplit",
  "EndOfBuffer", "NvimTreeNormal", "NvimTreeNormalNC",
  "NvimTreeEndOfBuffer", "NvimTreeVertSplit",
  "TermCursor", "CursorLine", "StatusLine", "StatusLineNC", "WinSeparator",
  -- Crucial for toggleterm transparency
  "ToggleTerm",
  "ToggleTermFloat", -- If you use float terminals
  "Term", -- Generic terminal highlight group, good to include
  "TermNormal", "TermNormalNC", -- Keep these as fallback
}
  for _, group in ipairs(groups) do
    save_original_bg(group)
  end
end

-- Call it once after colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Ensure your preferred colorscheme is set first
    vim.cmd.colorscheme("onedark")
    save_all_original_bgs()
    -- If transparency is already enabled, re-apply it after colorscheme loads
    if _G.transparent_enabled then
      _G.toggle_transparency()
    end
  end,
})

-- Call it once after colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd.colorscheme("onedark")
    save_all_original_bgs()
  end,
})

-- Apply transparency in neovim colorscheme
-- Global toggle state

function _G.toggle_transparency()
  local groups = {
    "Normal", "NormalNC", "NormalFloat", "FloatBorder", "VertSplit",
    "EndOfBuffer", "NvimTreeNormal", "NvimTreeNormalNC",
    "NvimTreeEndOfBuffer", "NvimTreeVertSplit",
    "TermNormal", "TermNormalNC",
    -- Add toggleterm specific groups here
    "ToggleTerm",
    "ToggleTermFloat",
    "Term",
  }

  if _G.transparent_enabled then
    -- Restore original colors
    for _, group in ipairs(groups) do
      local bg = _G.original_highlights[group]
      if bg ~= nil then
        vim.api.nvim_set_hl(0, group, { bg = bg })
      end
    end
  else
    -- Set background to transparent
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end

  _G.transparent_enabled = not _G.transparent_enabled
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    save_all_original_bgs()
    if _G.transparent_enabled then
      _G.toggle_transparency()
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*", -- This pattern applies to all terminal buffers
  callback = function()
    if _G.transparent_enabled then
      -- Use vim.defer_fn to give toggleterm a moment to apply its own highlights
      vim.defer_fn(function()
        vim.api.nvim_set_hl(0, "ToggleTerm", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "ToggleTermFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "Term", { bg = "NONE" })
      end, 50) -- 50ms delay
    end
  end,
})

vim.keymap.set("n", "<leader>tt", _G.toggle_transparency, { desc = "Toggle Transparency" })

return {}
