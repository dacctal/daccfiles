return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup({
			background = "hard",
			transparent_background_level = 0,
			italics = true,
			disable_italic_comments = false,
			sign_column_background = "none",
			ui_contrast = "high",
			dim_inactive_windows = false,
			diagnostic_line_highlight = true,
			diagnostic_text_highlight = true,
			diagnostic_virtual_text = "coloured",
			spell_foreground = true,
			show_eob = true,
			float_style = "dim",
			inlay_hints_background = "dimmed",
			on_highlights = {},
			colours_override = {},
			vim.cmd("colorscheme everforest"),
		})
	end,
}
