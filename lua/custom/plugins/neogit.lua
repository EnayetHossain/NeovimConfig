return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		-- Only one of these is needed.
		"sindrets/diffview.nvim", -- optional

		-- For a custom log pager
		"m00qek/baleia.nvim", -- optional
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>lg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
