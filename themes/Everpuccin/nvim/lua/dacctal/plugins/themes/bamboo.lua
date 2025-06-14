return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("bamboo").setup({
			-- optional configuration here
			transparent = true,
		})
		require("bamboo").load()
	end,
}
