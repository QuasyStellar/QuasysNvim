require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", function()
	require("conform").format { timeout_ms = 10000, lsp_fallback = true }
end, { desc = "general format file" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
vim.api.nvim_set_keymap("n", "<f5>", "", {
	noremap = true,
	silent = true,
	desc = "Run current file",
	callback = function()
		local ext = vim.fn.expand "%:e" -- Get file extension

		if ext == "cpp" or ext == "c" then
			vim.cmd "split term://g++ % -o %< && %< | setlocal nonumber norelativenumber| startinsert"
		elseif ext == "py" then
			vim.cmd "split term://py % | setlocal nonumber norelativenumber| startinsert"
		elseif ext == "java" then
			vim.cmd "split term://javac % && java %< | setlocal nonumber norelativenumber| startinsert"
		else
			print "Unsupported file type"
		end
	end,
})
