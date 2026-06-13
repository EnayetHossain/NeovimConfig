return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.install({
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
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local ft = vim.bo[args.buf].filetype

				local lang = vim.treesitter.language.get_lang(ft)

				if not lang then
					return
				end

				if not pcall(vim.treesitter.language.add, lang) then
					return
				end

				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}
