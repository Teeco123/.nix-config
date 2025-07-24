return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lspconfig").lua_ls.setup({})
			require("lspconfig").clangd.setup({
				filetypes = { "c", "cpp" },
				cmd = {
					"clangd",
					"--clang-tidy",
				},
			})
			require("lspconfig").svelte.setup({})
			require("lspconfig").ts_ls.setup({})
			require("lspconfig").sourcekit.setup({
				filetypes = { "swift", "objc", "objcpp" },
				cmd = { "xcrun", "sourcekit-lsp" },
			})
			require("lspconfig").bashls.setup({
				filetypes = { "bash", "sh", "conf" },
			})
			require("lspconfig").glsl_analyzer.setup({})
			require("lspconfig").nil_ls.setup({})
		end,
	},
}
