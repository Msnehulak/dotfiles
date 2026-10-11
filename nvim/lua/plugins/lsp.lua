return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"ruff",
					"stylua",
					"prettier",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "basedpyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Konfigurace běžných serverů pomocí nového vim.lsp.config
			local servers = { "lua_ls", "ts_ls", "html", "cssls" }
			for _, server in ipairs(servers) do
				vim.lsp.config(server, { capabilities = capabilities })
			end

			-- Konfigurace pro basedpyright
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							diagnosticSeverityOverrides = {
								reportUnusedCallResult = "none",
								reportUnknownMemberType = "none",
								reportAny = "none",
							},
						},
					},
				},
				-- Zapnutí sémantických tokenů z LSP
				on_attach = function(client, bufnr)
					if client.server_capabilities.semanticTokensProvider then
						client.server_capabilities.semanticTokensProvider.full = true
					end
				end,
			})

			-- Aktivace všech LSP serverů
			vim.lsp.enable({ "lua_ls", "ts_ls", "html", "cssls", "basedpyright" })

			-- Klávesové zkratky při připojení LSP k bufferu
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufopts = { silent = true, buffer = args.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
				end,
			})
		end,
	},
}
