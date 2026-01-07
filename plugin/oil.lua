require("oil").setup({
	-- buf_options = {
	-- 	buflisted = true,
	-- },
	columns = {
		"icon",
		"permissions",
		"size",
	},
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
	},
	skip_confirm_for_simple_edits = true,
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
