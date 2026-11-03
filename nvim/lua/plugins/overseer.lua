return {
	'stevearc/overseer.nvim',
	---@module 'overseer'
	---@type overseer.SetupOpts
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>oo", "<cmd>OverseerOpen<CR>")
		vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>")
		vim.keymap.set("n", "<leader>ot", "<cmd>OverseerTaskAction<CR>")
	end
}
