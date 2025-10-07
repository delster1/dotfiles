-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- NEOTREE
vim.keymap.set("n", "<C-n>", ":Neotree right reveal<CR>", { desc = "Neo-tree toggle" })

-- THEMERY
vim.keymap.set("n", "<leader>cc", ":Themery<CR>", { desc = "Neo-tree toggle" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
