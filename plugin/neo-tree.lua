require("neo-tree").setup({
	filesystem = {
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
		hijack_netrw_behavior = "disabled",
	},
})

vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" })
