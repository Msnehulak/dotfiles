return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-night") -- Můžeš zkusit i "tokyonight-night" nebo "tokyonight-moon"
		end,
	},
}
