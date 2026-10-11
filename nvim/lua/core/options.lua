vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldminlines = 1
vim.opt.foldcolumn = "2"
vim.opt.foldlevel = 99

vim.filetype.add({
	extension = {
		jinja = "htmldjango",
		jinja2 = "htmldjango",
		j2 = "htmldjango",
		html = "htmldjango",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "htmldjango", "lua", "javascript", "typescript", "css" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
