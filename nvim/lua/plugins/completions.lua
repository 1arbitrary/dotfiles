return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		version = "1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},
			snippets = { preset = "luasnip" },
			completion = {
				documentation = { auto_show = true },
				ghost_text = { enabled = true, show_with_menu = true },
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
		},
	},
	{
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
	},
}
