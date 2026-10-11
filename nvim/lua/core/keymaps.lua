vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lepší změna velikosti oken (respektuje směr šipek)
vim.keymap.set("n", "<M-j>", "<cmd>wincmd -<CR>") -- Zmenšit vertikálně
vim.keymap.set("n", "<M-k>", "<cmd>wincmd +<CR>") -- Zvětšit vertikálně
vim.keymap.set("n", "<M-h>", "<cmd>wincmd <<CR>") -- Zmenšit horizontálně
vim.keymap.set("n", "<M-l>", "<cmd>wincmd ><CR>") -- Zvětšit horizontálně

-- V Insert módu (psaní) stačí napsat rychle 'jk' a přepne tě to do Normal módu
vim.keymap.set("i", "jk", "<Esc>", { desc = "Návrat do Normal módu", nowait = true })

-- V terminálu stačí zmáčknout Esc pro návrat do Normal módu
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Ukončit psaní v terminálu" })

vim.keymap.set("n", "<leader>ag", ":TermExec cmd='agy'<CR>", { silent = true })

vim.keymap.set("n", "<space>", "za", { desc = "Toggle fold" })

vim.api.nvim_set_keymap("t", "<C-v><Esc>", "<Esc>", { noremap = true, silent = true })
