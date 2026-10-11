return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Nápověda z LSP
			"hrsh7th/cmp-path", -- Nápověda pro cesty k souborům
			"hrsh7th/cmp-buffer", -- Nápověda ze slov v aktuálním souboru
			"L3MON4D3/LuaSnip", -- Engine pro snippety
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- Vyvolat nápovědu ručně
					["<C-e>"] = cmp.mapping.abort(), -- Zavřít nápovědu
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Potvrdit Enterem
					["<Tab>"] = cmp.mapping(function(fallback) -- Procházení tabulátorem
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Přednost má LSP
					{ name = "luasnip" }, -- Pak snippety
				}, {
					{ name = "buffer" }, -- Nakonec slova ze souboru
					{ name = "path" }, -- A cesty
				}),
			})
		end,
	},
}
