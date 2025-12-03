return {
  "hedyhli/outline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
  },
  config = function()
    require("outline").setup({
      symbols = {
        -- Global/default behavior
        filter = {
          -- Default: hide Strings for all filetypes
          default = { "String", exclude = true },

          -- Python-specific filter:
          -- Only show Functions + Classes
          python = { "Function", "Class" },
        },
      },
    })
  end,
}

