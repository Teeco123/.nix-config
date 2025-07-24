return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				swift = { "swift_format", "swiftlint" },
				bash = { "shfmt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				nix = { "nixfmt" },
				cpp = { "clang-format" },
			},
			formatters = {
				swift_format = {
					command = "swift-format",
					args = { "--in-place", "$FILENAME" },
				},
				swiftlint = {
					command = "swiftlint",
					args = { "--fix", "--format", "--quiet", "$FILENAME" },
					stdin = false,
				},
			},

			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				local disable_lsp_fallback = {
					glsl = true,
				}
				return {
					lsp_fallback = not disable_lsp_fallback[ft],
					timeout_ms = 500,
				}
			end,
		},
	},
}
