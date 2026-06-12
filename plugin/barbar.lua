if vim.g.started_by_firenvim then
	vim.g.barbar_auto_setup = false
end

vim.keymap.set("n", "<m-l>", "<cmd>BufferNext<CR>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<m-h>", "<cmd>BufferPrevious<CR>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "<m-c-l>", "<cmd>BufferMoveNext<CR>", { silent = true, desc = "Move buffer to the right" })
vim.keymap.set("n", "<m-c-h>", "<cmd>BufferMovePrevious<CR>", { silent = true, desc = "Move buffer to the left" })
vim.keymap.set("n", "<leader>cc", "<cmd>BufferClose<CR>", { silent = true, desc = "[c]lose [c]urrent buffer" })
vim.keymap.set("n", "<leader>cC", "<cmd>BufferClose!<CR>", { silent = true, desc = "[c]lose [C]urrent buffer forcing" })
vim.keymap.set(
	"n",
	"<leader>cr",
	"<cmd>BufferCloseBuffersRight<CR>",
	{ silent = true, desc = "[c]lose all to the [r]ight" }
)
vim.keymap.set(
	"n",
	"<leader>cA",
	"<cmd>BufferCloseAllButCurrent<CR>",
	{ silent = true, desc = "[c]lose [A]ll buffers but current" }
)
