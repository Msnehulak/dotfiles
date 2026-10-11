return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,
		opts = {
			provider = "gemini",
			auto_suggestions_provider = "gemini",
			-- Zde je ta změna: vše se nově dává do tabulky providers
			providers = {
				gemini = {
					model = "gemini-3.1-flash-lite", -- gemini-2.5-flash , gemini-2.5-flash
					max_tokens = 4096,
					temperature = 0,
				},
			},
		},
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-tree/nvim-web-devicons",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "markdown", "Avante" } },
				ft = { "markdown", "Avante" },
			},
		},
	},
}
