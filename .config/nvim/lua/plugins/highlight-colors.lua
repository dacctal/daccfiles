return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		vim.opt.termguicolors = true

		require("nvim-highlight-colors").setup({})
	end,
}
