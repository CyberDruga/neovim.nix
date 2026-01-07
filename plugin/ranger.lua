local ranger = require("ranger-nvim")
local ui = {
	border = "rounded",
	height = 0.9,
	width = 0.9,
}

ranger.setup({
	replace_netrw = true,
	ui = ui,
})

local openInCurrentFile = function()
	ranger.open(true)
end

local openAtWorkspaceRoot = function()
	ranger.open(false)
end

vim.keymap.set("n", "<leader>or", openInCurrentFile, { silent = true, desc = "[o]pen [r]anger" })
vim.keymap.set("n", "<leader>ow", openAtWorkspaceRoot, { silent = true, desc = "[o]pen ranger at [w]orkspace root" })
