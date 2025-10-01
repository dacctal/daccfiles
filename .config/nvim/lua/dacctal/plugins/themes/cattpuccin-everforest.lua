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
					rosewater = "#ea6962",
					flamingo = "#ea6962",
					red = "#ea6962",
					maroon = "#ea6962",
					pink = "#d3869b",
					mauve = "#ea6962",
					peach = "#d3869b",
					yellow = "#d8a657",
					green = "#40d672",
					teal = "#89cbca",
					sky = "#e78a4e",
					sapphire = "#89cbca",
					blue = "#89a9cb",
					lavender = "#89a9cb",
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
