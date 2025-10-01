return {
	"thesimonho/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("kanagawa-paper").setup({
			transparent = true,
			vim.cmd.colorscheme("kanagawa-paper-ink"),
		})
	end,
}
