local M = {}

M.setup = function()
	local noice = require "noice"

	-- Настройка noice.nvim
	noice.setup {
		lsp = {
			-- Переопределение рендеринга markdown для использования Treesitter с плагинами, такими как cmp
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- Требуется nvim-cmp
			},
		},
		-- Включение пресетов для упрощённой конфигурации
		presets = {
			bottom_search = true, -- Использовать классическую строку поиска внизу
			command_palette = true, -- Разместить командную строку и всплывающее меню рядом
			long_message_to_split = true, -- Длинные сообщения отправляются в split
			inc_rename = false, -- Отключить диалоговое окно для inc-rename.nvim
			lsp_doc_border = false, -- Добавить границу для hover docs и signature help
		},
	}
end

return M
