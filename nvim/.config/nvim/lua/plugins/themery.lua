return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "everforest",
          "gruvbox",
          "rose-pine",
          "cyberdream",
          "evergarden",
          "nightfox",
          "duskfox",
          "nordfox",
          "terafox",
          "carbonfox",
          "nordic",
          "dracula",

        }
      })
    end
  }
