-- Gives us LSP support through SourceKit-LSP
return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.sourcekit.setup {
				-- SourceKit-LSP relies on the editor informing the server when files change.
				-- Communicate this via "dynamic registration".
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			}

			-- We’ll set up an auto command that fires when an LSP server attaches in the config function under where we set up the sourcekit server.
			-- The keybindings are applied to all LSP servers so you end up with a consistent experience across languages.
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP Actions',
				callback = function(args)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
				end,
			})
		end,
	}
}
