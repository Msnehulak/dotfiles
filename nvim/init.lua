-- 1. Načtení tvého základního nastavení a klávesových zkratek
require("core.options")
require("core.keymaps")

-- 2. Automatická instalace lazy.nvim (pokud ho ještě nemáš stažený v systému)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 3. Spuštění lazy.nvim a automatické načtení všeho ze složky lua/plugins/
require("lazy").setup("plugins")
