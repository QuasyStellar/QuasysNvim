local M = {}

M.setup = function()
	local lint = require "lint"

	lint.linters_by_ft = {
		python = { "ruff", "mypy" },
		cpp = { "cpplint", "cppcheck" },
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	vim.keymap.set("n", "<leader>l", function()
		lint.try_lint()
	end, { desc = "Trigger linting for current file" })

	-- Настройка диагностики
	vim.diagnostic.config {
		virtual_text = true, -- Отключаем виртуальный текст
		signs = true, -- Оставляем знаки для ошибок
		underline = true, -- Включаем подчеркивание
		update_in_insert = true,
	}

	-- Настройка подчеркивания (только подчеркивание, без изменения цвета текста)
	vim.api.nvim_command "highlight DiagnosticUnderlineError gui=underline guisp=#FF0000" -- Яркое подчеркивание для ошибок (красный)
	vim.api.nvim_command "highlight DiagnosticUnderlineWarn gui=underline guisp=#FF9900" -- Яркое подчеркивание для предупреждений (оранжевый)
	vim.api.nvim_command "highlight DiagnosticUnderlineInfo gui=underline guisp=#0000FF" -- Яркое подчеркивание для информационных сообщений (синий)
	vim.api.nvim_command "highlight DiagnosticUnderlineHint gui=underline guisp=#00FF00" -- Яркое подчеркивание для подсказок (зеленый)

	-- Настройка для отображения диагностики при наведении
	vim.api.nvim_create_autocmd("CursorHold", {
		group = lint_augroup,
		callback = function()
			-- Открываем всплывающее окно с диагностикой
			vim.diagnostic.open_float(nil, {
				focusable = false, -- Окно не будет фокусироваться
				scope = "line", -- Окно появляется около курсора
				border = "single", -- Окно с рамкой
			})
		end,
	})
end

return M
