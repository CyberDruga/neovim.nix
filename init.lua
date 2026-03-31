-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.wo.relativenumber = true

vim.opt.scrolloff = 5

vim.opt.foldmethod = "marker"

vim.opt.tabstop = 2

vim.opt.shiftwidth = 2

vim.opt.cursorline = true

vim.opt.colorcolumn = "120"

vim.opt.list = false

vim.notify = require("notify")
vim.print = require("notify")

-- NOTE: Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous [D]iagnostic message" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next [D]iagnostic message" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- quit some windows list
vim.cmd([[
augroup diagnostics
  autocmd!
  autocmd FileType qf,sagarename,gitsigns-blame,fugitiveblame nmap <buffer> q <cmd>q<cr>
  autocmd FileType vim nmap <buffer> q <cmd>q<cr>
  autocmd FileType vim nmap <buffer> <esc> <cmd>q<cr>
  autocmd FileType sagarename nmap <buffer> <esc> <cmd>q<cr>
augroup end
]])

-- NOTE: weird edge case in an obscure java library called ZK where css files have the extension .css.dsp
vim.cmd([[
augroup zk_css
  autocmd!
  autocmd BufRead,BufNewFile *css.dsp set filetype=css
augroup end
]])

-- LazyGit/Git commands
vim.keymap.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { silent = true, desc = "Open Lazygit" })
vim.keymap.set(
	"n",
	"<leader>gc",
	"<CMD>LazyGitCurrentFile<CR>",
	{ silent = true, desc = "Open Lazygit with curent file" }
)
vim.keymap.set("n", "<leader>gb", "<CMD>Git blame<CR>", { silent = true, desc = "Open Git Blame" })

-- vim.keymap.set('n', '<', '<<_', { noremap = true, silent = true })
-- vim.keymap.set('n', '>', '>>_', { noremap = true, silent = true })

vim.keymap.set("v", "<", "<<gv", { noremap = true, silent = true, desc = "Ident backwards" })
vim.keymap.set("v", ">", ">>gv", { noremap = true, silent = true, desc = "Ident forwards" })

vim.keymap.set("n", "<c-h>", "<c-w>h", { silent = true, desc = "Move focus left" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { silent = true, desc = "Move focus down" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { silent = true, desc = "Move focus up" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { silent = true, desc = "Move focus right" })

vim.keymap.set("n", "<leader>z", ":UndotreeToggle<CR>", { silent = true })

vim.keymap.set("n", "<C-h>", "h", { silent = true, desc = "Move focus left" })
vim.keymap.set("n", "<C-j>", "j", { silent = true, desc = "Move focus down" })
vim.keymap.set("n", "<C-k>", "k", { silent = true, desc = "Move focus up" })
vim.keymap.set("n", "<C-l>", "l", { silent = true, desc = "Move focus right" })

vim.keymap.set("n", "<M-j>", ":m .+1<CR>", { silent = true, desc = "Move line up" })
vim.keymap.set("x", "<M-j>", ":m '>+1<CR>gv-gv", { silent = true, desc = "Move line up" })

vim.keymap.set("n", "<M-k>", ":m .-2<CR>", { silent = true, desc = "Move line down" })
vim.keymap.set("x", "<M-k>", ":m '<-2<CR>gv-gv", { silent = true, desc = "Move line down" })

vim.keymap.set({ "n", "v" }, "<leader>rR", ':s;\\<"\\>;', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>rr", ':s;";', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ra", ":s;$;", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ri", ":s;^;", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>rf", ':s;";', { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>a:", ":Tab /:<cr>", { silent = true, desc = "Aligns text using [:]" })
vim.keymap.set({ "n", "v" }, "<leader>a,", ":Tab /,<cr>", { silent = true, desc = "Aligns text using [,]" })
vim.keymap.set({ "n", "v" }, "<leader>a=", ":Tab /=<cr>", { silent = true, desc = "Aligns text using [=]" })
vim.keymap.set({ "n", "v" }, "<leader>a|", ":Tab /|<cr>", { silent = true, desc = "Aligns text using [|]" })
vim.keymap.set({ "n", "v" }, "<leader>a ", ":Tab / <cr>", { silent = true, desc = "Aligns text using [ ]" })
vim.keymap.set({ "n", "v" }, "<leader>a;", ":Tab /;<cr>", { silent = true, desc = "Aligns text using [;]" })
vim.keymap.set({ "n", "v" }, "<leader>a;", ":Tab<cr>", { silent = true, desc = "Re-aligns text" })

vim.cmd([[
	unmenu PopUp.How-to\ disable\ mouse
]])

-- Remap for dealing with word wrap
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Moves cursor up by a visual line" }
)
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Moves cursor down by a visual line" }
)

vim.keymap.set("n", "<leader>oc", function()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		return
	end
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.cmd(string.format("silent !code --goto %s:%s:%s", path, row, col))
end, { silent = true, desc = "[o]pen current file on vs[c]ode" })

-- Enables UI2
require("vim._core.ui2").enable()

-- set autoformatting
vim.g.autoformat = true
vim.keymap.set({ "n", "v" }, "<leader>ta", function()
	vim.g.autoformat = not vim.g.autoformat
end, { silent = true, desc = "Toggles [A]utoformat" })
