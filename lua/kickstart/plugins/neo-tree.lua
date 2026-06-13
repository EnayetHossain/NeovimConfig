-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- Ensure filtered items are visible
				hide_dotfiles = false, -- Show files starting with a dot (e.g., .env, .gitignore)
				hide_gitignored = false, -- Show files ignored by Git (e.g., node_modules)
				hide_hidden = false, -- Show hidden files on Windows/macOS
			},
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
