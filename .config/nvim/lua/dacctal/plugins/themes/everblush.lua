return {
	"Everblush/nvim",
	name = "everblush",
	config = function()
		require("everblush").setup({
			override = {},
			transparent_background = true,
			vim.cmd("colorscheme everblush"),
		})
	end,
}
