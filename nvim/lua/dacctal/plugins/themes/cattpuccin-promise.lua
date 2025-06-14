return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
			transparent_background = true,
			color_overrides = {
				mocha = {
					rosewater = "#f43e9c",
					flamingo = "#f76eb5",
					red = "#f45252",
					maroon = "#f76eb5",
					pink = "#f76e6e",
					mauve = "#f45252",
					peach = "#f76e6e",
					yellow = "#f7cd6e",
					green = "#18f160",
					teal = "#0cc0bf",
					sky = "#f7864f",
					sapphire = "#6ef7f6",
					blue = "#3e97f4",
					lavender = "#6eb1f7",
					text = "#ebdbb2",
					subtext1 = "#d5c4a1",
					subtext0 = "#bdae93",
					overlay2 = "#a89984",
					overlay1 = "#928374",
					overlay0 = "#595a5a",
					surface2 = "#434242",
					surface1 = "#302f2f",
					surface0 = "#292929",
					base = "#070707",
					mantle = "#121111",
					crust = "#262321",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
