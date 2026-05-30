_G.transparent_enabled = false
_G.original_highlights = {}

local groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"VertSplit",
	"WinSeparator",
	"EndOfBuffer",

	-- Status line
	"StatusLine",
	"StatusLineNC",

	-- Cursor/lines
	"CursorLine",

	-- NvimTree
	"NvimTreeNormal",
	"NvimTreeNormalNC",
	"NvimTreeEndOfBuffer",
	"NvimTreeVertSplit",

	-- Terminal
	"Term",
	"TermNormal",
	"TermNormalNC",
	"ToggleTerm",
	"ToggleTermFloat",
}

local function save_original_highlights()
	for _, group in ipairs(groups) do
		local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
			name = group,
			link = false,
		})

		if ok then
			_G.original_highlights[group] = hl.bg or "NONE"
		end
	end
end

local function set_transparent_highlights()
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, {
			bg = "NONE",
		})
	end
end

local function restore_original_highlights()
	for _, group in ipairs(groups) do
		local bg = _G.original_highlights[group]

		if bg ~= nil then
			vim.api.nvim_set_hl(0, group, {
				bg = bg,
			})
		end
	end
end

function _G.toggle_transparency()
	if _G.transparent_enabled then
		restore_original_highlights()
	else
		set_transparent_highlights()
	end

	_G.transparent_enabled = not _G.transparent_enabled
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		save_original_highlights()

		if _G.transparent_enabled then
			vim.schedule(function()
				set_transparent_highlights()
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		if _G.transparent_enabled then
			vim.defer_fn(function()
				set_transparent_highlights()
			end, 50)
		end
	end,
})

vim.keymap.set("n", "<leader>tt", _G.toggle_transparency, { desc = "Toggle Transparency" })

return {}
