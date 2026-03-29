return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config["lua_ls"] = {
      cmd = { "lua-language-server" },
      capabilities = capabilities,
      filetypes = { "lua" },
      root_markers = { ".git" },
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    }

    vim.lsp.config["clangd"] = {
      cmd = {
        "clangd",
        "--fallback-style=llvm",
      },
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      root_markers = { ".git" },
    }

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("clangd")

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = false })
    end, { desc = "LSP Format" })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
  end,
}
