return {
	"startup-nvim/startup.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		require("startup").setup(require("config.startup.startup_nvim"))
	end,
}
