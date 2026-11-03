vim.opt.relativenumber = true
vim.opt.modeline = true

vim.cmd("syntax on")

vim.g.mapleader= " "
vim.g.localmapleader="\\"

-- keybinds
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", {
    desc = "Open Lazy"
})

vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", {
    desc = "Unselect highlighted text"
})

vim.keymap.set("n", "<leader>pf", "<cmd>lua vim.lsp.buf.format()<cr>", {
    desc = "Format file using lsp"
})

vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", {
    desc = "Open File Explorer"
})

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", {
    desc = "Write file"
})

vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", {
    desc = "quit"
})

vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", {
    desc = "Write file and quit"
})
