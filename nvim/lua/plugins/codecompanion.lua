-- ~/.config/nvim/lua/plugins/codecompanion.lua
return {
	"olimorris/codecompanion.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("codecompanion").setup({
			strategies = {
				inline = { adapter = "agy_cli" },
				chat = { adapter = "agy_cli" },
			},
			adapters = {
				agy_cli = function()
					return require("codecompanion.adapters").extend("cmd", {
						name = "agy_cli",
						formatted_name = "Antigravity CLI",
						roles = {
							user = "user",
							model = "assistant",
						},
						command = "agy",
						args = { "-p" }, -- agy přečte zadaný prompt
					})
				end,
			},
		})
	end,
}
