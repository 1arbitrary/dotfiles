vim.opt.relativenumber = true
vim.opt.modeline = true

vim.cmd("syntax on")

vim.g.mapleader= " "
vim.g.localmapleader="\\"

-- keybinds
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", {
    desc = "Open Lazy"
})
