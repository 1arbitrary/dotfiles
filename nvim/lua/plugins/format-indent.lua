return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local ibl = require("ibl")
			ibl.setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "biome", lsp_format = "fallback" },
					html = { lsp_format = "first" },
					css = { lsp_format = "first" },
					c = { "clang_format", lsp_format = "fallback" },
				},
				default_format_opts = {},
				log_level = vim.log.levels.ERROR,
				notify_on_error = true,
				notify_no_formatters = true,
			})
			vim.keymap.set("n", "<leader>gf", conform.format, { desc = "Format file with Conform" })
		end,
	},
}
