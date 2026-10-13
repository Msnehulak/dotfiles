return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			python = { "ruff_organize_imports", "ruff_format" },
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			htmldjango = { "djhtml" },
		},
		formatters = {
			djhtml = {
				command = "djhtml",
				args = { "-t", "2", "-" },
			},
		},
		format_after_save = {
			async = true,
			lsp_fallback = true,
		},
	},
}
