-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- NEOTREE
vim.keymap.set("n", "<C-n>", ":Neotree right reveal<CR>", { desc = "Neo-tree toggle" })

-- THEMERY
vim.keymap.set("n", "<leader>cc", ":Themery<CR>", { desc = "Neo-tree toggle" })

-- LSP 
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "grr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<leader>so', ":syntax on<CR>", {})

-- NAVIGATION
vim.keymap.set('n', '<leader>j', ":cnext <CR>", {desc = "fwd in qflist"})
vim.keymap.set('n', '<leader>k', ":cprev <CR>", {desc = "back in qflist"})

-- TELESCOPE 
vim.keymap.set('n', "<leader>lf", ":Telescope oldfiles<CR>",{desc = "Telescope oldfiles"} )

-- OUTLINE
vim.keymap.set('n', "<leader>ls", ":Outline <CR>",{desc = "Outline Symbols"} )

-- OIL 
local function find_oil_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "oil" then
      local cfg = vim.api.nvim_win_get_config(win)
      if cfg and cfg.relative and cfg.relative ~= "" then
        return win
      end
    end
  end
end

---Toggle Oil floating window.
---If a float is open, close it; otherwise open one (optionally at `dir`).
---@param dir? string directory to open (defaults to cwd)
local function toggle(dir)
  local float = find_oil_float_win()
  if float then
    vim.api.nvim_win_close(float, true)
  else
    require("oil").open_float(dir)
  end
end
vim.keymap.set("n", "<leader>o", function()
  local dir = vim.fn.expand("%:p:h")
  toggle(dir)
end, { desc = "Oil (float) toggle" })

