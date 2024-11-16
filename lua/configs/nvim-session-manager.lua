local M = {}

function M.setup()
	local Path = require "plenary.path"
	local config_group = vim.api.nvim_create_augroup("MyConfigGroup", {}) -- Создаём группу автокоманд
	local config = require "session_manager.config"
	require("session_manager").setup {
		sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- Папка для сессий
		autoload_mode = config.AutoloadMode.CurrentDir, -- Автозагрузка для текущей директории
		autosave_last_session = true, -- Автосохранение последней сессии
		autosave_ignore_not_normal = true, -- Игнорировать не Normal буферы
		autosave_ignore_dirs = { "/", "/tmp" }, -- Директории, которые не будут сохранены
		autosave_ignore_filetypes = { "gitcommit", "gitrebase" }, -- Типы файлов для игнорирования
		autosave_ignore_buftypes = { "nofile", "prompt" }, -- Игнорируемые типы буферов
	}

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "SessionLoadPost", -- Выполняется после загрузки сессии
		group = config_group,
		callback = function()
			require("nvim-tree.api").tree.toggle(false, true) -- Открыть NvimTree
		end,
	})
	-- Пример ключевых комбинаций
	vim.keymap.set("n", "<leader>sl", ":SessionManager load_session<CR>", { desc = "Load session" })
	vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>", { desc = "Save session" })
	vim.keymap.set("n", "<leader>sd", ":SessionManager delete_session<CR>", { desc = "Delete session" })
	vim.keymap.set("n", "<leader>sr", ":SessionManager load_last_session<CR>", { desc = "Restore last session" })
end

return M
