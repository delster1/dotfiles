return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
        {},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)
	--
	-- 		local lspconfig = vim.lsp.config
	--
	-- 		lspconfig.tailwindcss.setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 		lspconfig.ruby_lsp.setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 		lspconfig.lua_ls.setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 		lspconfig.marksman.setup({
	-- 			capabilities = capabilities,
	-- 		})
	--      lspconfig.ltex.setup({
	--      settings = {
	--        ltex = {
	--          language = "en-US",  -- or "en-GB", etc.
	--        }
	--        }
	--      })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
