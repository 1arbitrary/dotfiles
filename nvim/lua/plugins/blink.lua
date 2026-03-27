return {
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },

    opts = {
      keymap = {
        preset = 'default',

        -- Enter confirms completion
        ['<CR>'] = { 'accept', 'fallback' },

        -- Optional but useful (keep or remove if you want stricter control)
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = {
          auto_show = true,
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- safe fallback (no Rust dependency issues)
      fuzzy = {
        implementation = "lua",
      },
    },
  }
}
