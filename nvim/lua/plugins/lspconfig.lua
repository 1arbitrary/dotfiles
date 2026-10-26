return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.lsp.config['clangd'] = {
			init_options = { fallbackFlags = { '-std=c++23' } },
		}
		vim.lsp.enable({ 'lua_ls', 'clangd' })
	end
}
