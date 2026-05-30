return {
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",

				enable = {
					terminal = true,
					legacy_highlights = true,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{ "Yazeed1s/minimal.nvim", lazy = false, priority = 1000 },

	{ "dchinmay2/alabaster.nvim", lazy = false, priority = 1000 },

	{ "sainnhe/everforest", lazy = false, priority = 1000 },

	{ "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },

	{ "olimorris/onedarkpro.nvim", lazy = false, priority = 1000 },

	{ "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },

	{ "shaunsingh/nord.nvim", lazy = false, priority = 1000 },

	{ "sainnhe/sonokai", lazy = false, priority = 1000 },

	{ "AlexvZyl/nordic.nvim", lazy = false, priority = 1000 },

	{ "bluz71/vim-moonfly-colors", lazy = false, priority = 1000 },

	{ "neanias/everforest-nvim", lazy = false, priority = 1000 },

	{ "tiagovla/tokyodark.nvim", lazy = false, priority = 1000 },

	{ "ribru17/bamboo.nvim", lazy = false, priority = 1000 },

	{ "everviolet/nvim", lazy = false, priority = 1000 },

	{ "nyoom-engineering/nyoom.nvim", lazy = false, priority = 1000 },

	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

	-- onedark
	{ "navarasu/onedark.nvim", lazy = false, priority = 1000 },

	-- Catppuccin
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },

	-- Gruvbox
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },

	-- Nord
	{ "shaunsingh/nord.nvim", lazy = false, priority = 1000 },

	-- Solarized
	{ "maxmx03/solarized.nvim", lazy = false, priority = 1000 },

	-- tokyonight
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
