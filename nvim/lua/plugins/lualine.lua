return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight',
          globalstatus = true,

          -- rounded look
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },

        sections = {
          -- LEFT
          lualine_a = {
            { 'mode', separator = { left = '' } },
          },

          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              symbols = { error = '✘ ', warn = '▲ ', info = '● ' },
            },
          },

          lualine_c = {
            { 'filename', path = 1 },
          },

          -- RIGHT
          lualine_x = {
            'filetype',
          },

          lualine_y = {
            'progress',
          },

          lualine_z = {
            { 'location', separator = { right = '' } },
          },
        },
      })

      -- transparency fixes
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
    end
  }
}
