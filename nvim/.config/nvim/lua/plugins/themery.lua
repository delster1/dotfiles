return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"everforest",
				"gruvbox",
				"rose-pine",
				"rose-pine-dawn",
				"cyberdream-light",
				"cyberdream",
				"evergarden",
				"nightfox",
				"dayfox",
				"duskfox",
				"nordfox",
				"terafox",
				"carbonfox",
				"nordic",
				"dracula",
			},
			before = function(theme)
				local light_themes = {
					["rose-pine-dawn"] = true,
					["cyberdream-light"] = true,
					["dayfox"] = true,
				}

				if light_themes[theme] then
					vim.o.background = "light"
				else
					vim.o.background = "dark"
				end
			end,
		})
	end,
}
