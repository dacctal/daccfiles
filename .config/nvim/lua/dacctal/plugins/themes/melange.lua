return {
	"savq/melange-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("melange").setup({
			-- Your config here
			transparent = true,
			vim.cmd("colorscheme melange"),
		})
	end,
}
