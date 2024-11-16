require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", function()
	require("conform").format { timeout_ms = 10000, lsp_fallback = true }
end, { desc = "general format file" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
