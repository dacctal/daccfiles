return {
	{
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
  {
    "akinsho/org-bullets.nvim",
    config = function()
      require('org-bullets').setup()
    end
  },
}
