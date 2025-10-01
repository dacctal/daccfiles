return {
	"ilof2/posterpole.nvim",
	priority = 1000,
	config = function()
		local posterpole = require("posterpole")

		posterpole.setup({
			-- config here
			brightness = -1,
			transparent = false,
		})
		vim.cmd("colorscheme posterpole")

		-- This function create sheduled task, which will reload theme every hour
		-- Without "setup_adaptive" adaptive brightness will be set only after every restart
		posterpole.setup_adaptive()
	end,
}
