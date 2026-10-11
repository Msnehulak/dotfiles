return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Hledat soubory" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Hledat text v projektu" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Otevřené buffery" })
	end,
}
