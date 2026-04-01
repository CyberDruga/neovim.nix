require("lspsaga").setup({
	lightbulb = {
		enable = false,
	},
	ui = {
		devicon = false,
		foldericon = false,
	},
})

vim.keymap.set("n", "gp", "<CMD>Lspsaga peek_definition<CR>", { silent = true, desc = "LSP: Peek Definition" })
vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { silent = true, desc = "LSP: Show hover description" })
vim.keymap.set("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", { silent = true, desc = "LSP: Rename entity" })
vim.keymap.set("n", "<leader>fu", "<CMD>Lspsaga finder<CR>", { silent = true, desc = "LSP: Find usages" })
