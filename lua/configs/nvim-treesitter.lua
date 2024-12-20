local opts = {
	ensure_installed = {
		"vim",
		"lua",
		"cpp",
		"c",
		"gitcommit",
		"vimdoc",
		"html",
		"css",
		"typescript",
		"javascript",
		"go",
		"python",
	},
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}

return opts
