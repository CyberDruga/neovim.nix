require("cloak").setup({
	enabled = true,
	patterns = {
		{
			file_pattern = "*config.yaml",
			cloak_pattern = { ":.+", "-.+" },
		},
		{
			file_pattern = "*config.toml",
			cloak_pattern = { "(=).*" },
		},
		{
			file_pattern = ".env*",
			cloak_pattern = { "(=).+" },
		},
	},
})

vim.keymap.set("n", "<leader>tc", ":CloakToggle<CR>", { silent = true, desc = "[t]oggle [c]loak" })
