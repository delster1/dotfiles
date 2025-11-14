return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		config = function()
			require("telescope").load_extension("git_branch")
		end,
		-- or                              , branch = '0.1.x',
	},
	{
		"mrloop/telescope-git-branch.nvim",
	},
}
