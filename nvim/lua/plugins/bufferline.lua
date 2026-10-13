return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs", -- Zde dojde ke změně na nativní taby Neovimu
				separator_style = "slant",
				show_buffer_close_icons = true,
				show_close_icon = true,
			},
		})
	end,
}
