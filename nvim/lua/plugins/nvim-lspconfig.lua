return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  config = function ()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.lsp.config['lua_ls'] = {
      cmd = { 'lua-language-server' },
      capabilities = capabilities,
      filetypes = { 'lua' },
      root_markers = { '.git' },

      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        }
      }
    }

    vim.lsp.config['clangd'] = {
      cmd = { 'clangd' },
      filetypes = { 'c', 'cpp' },
      root_markers = { '.git' },
      capabilities = capabilities
    }

    vim.lsp.enable('lua_ls')
    vim.lsp.enable('clangd')
  end
}
