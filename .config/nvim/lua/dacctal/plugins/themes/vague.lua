return {
	"vague2k/vague.nvim",
	config = function()
		require("vague").setup({
			-- optional configuration here
			transparent = true,
			vim.cmd("colorscheme vague"),
		})
	end,
}
