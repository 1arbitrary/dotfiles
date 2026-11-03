return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.lsp.config['clangd'] = {
			init_options = { fallbackFlags = { '-std=c++23' } },
		}
		vim.lsp.enable({ 'lua_ls', 'clangd', 'gopls' })
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf, silent = true }
				vim.keymap.set("n", "<leader>ca", "<cmd>ClangdAST<CR>", opts)
				vim.keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<CR>", opts)
				vim.keymap.set("n", "<leader>ch", "<cmd>ClangdTypeHierarchy<CR>", opts)
				vim.keymap.set("n", "<leader>cs", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
				vim.keymap.set("n", "<leader>cm", "<cmd>ClangdMemoryUsage<CR>", opts)
			end,
		})
	end
}
