return {
	
	{
		-- Mason for managing external tools
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		-- Mason integration with LSP configurations
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { { "saghen/blink.cmp" }, { "L3MON4D3/LuaSnip", version = "v2.*" } },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				gopls = {},
				clangd = {},
				biome = {},
				dprint = {},
				glint = {},
				marksman = {},
				pyre = {},
				pyright = {},
				pylsp = {},
				harper_ls = {},
				ast_grep = {},
				basedpyright = {},
				ts_ls = {},
				rust_analyzer = {},
				lua_ls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local ls = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,

		-- example calling setup directly for each LSP
	},
}
