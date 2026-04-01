-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
require("nvim-treesitter").setup({
	-- NOTE: nixCats: use lazyAdd to only set these 2 options if nix wasnt involved.
	-- because nix already ensured they were installed.
	-- ensure_installed = {
	-- 	"bash",
	-- 	"c",
	-- 	"diff",
	-- 	"html",
	-- 	"lua",
	-- 	"luadoc",
	-- 	"markdown",
	-- 	"vim",
	-- 	"vimdoc",
	-- },
	auto_install = false,

	highlight = {
		enable = true,
		-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
		--  If you are experiencing weird indenting issues, add the language to
		--  the list of additional_vim_regex_highlighting and disabled languages for indent.
		additional_vim_regex_highlighting = { "ruby" },
	},
	indent = { enable = true, disable = { "ruby" } },
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreeSitterFileType", { clear = true }),
	pattern = {
		"go",
		"gomod",
		"java",
		"bash",
		"lua",
		"markdown",
	},
	callback = function(args)
		vim.treesitter.start(args.buf)
	end,
})

-- Prefer git instead of curl in order to improve connectivity in some environments
-- require("nvim-treesitter.install").prefer_git = true

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
