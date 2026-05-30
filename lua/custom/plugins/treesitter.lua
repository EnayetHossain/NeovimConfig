return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Set compiler preference BEFORE setup
		require("nvim-treesitter.install").compilers = { "zig", "clang", "gcc" }

		require("nvim-treesitter").setup({
			highlight = { enable = true },
			indent = { enable = true },
		})

		-- Install the parsers we need
		local parsers = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"javascript",
			"python",
			"typescript",
			"tsx",
		}
		require("nvim-treesitter").install(parsers)
	end,
}
