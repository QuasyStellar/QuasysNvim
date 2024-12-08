-- Основные настройки интерфейса и функций
local options = {
	-- Настройки основной темы и интерфейса base46
	base46 = {
		theme = "catppuccin",
		theme_toggle = { "catppuccin", "catpuccin" }, -- Переключение между темами "onedark" и "one_light"
		transparency = false, -- Отключает прозрачность
		hl_add = {}, -- Дополнительные настройки подсветки
		hl_override = {}, -- Переопределение стандартных настроек подсветки
		integrations = {}, -- Интеграции с другими плагинами или модулями
		changed_themes = {}, -- Хранит измененные темы для удобного переключения
	},

	-- Настройки пользовательского интерфейса
	ui = {
		cmp = { -- Настройки для автодополнения (Completion)
			icons_left = false, -- Отключает иконки слева от текста
			lspkind_text = true, -- Включает отображение текста для типов LSP
			style = "default", -- Устанавливает стандартный стиль отображения
			format_colors = { tailwind = false, icon = "󱓻" }, -- Настройка цвета иконок
		},
		telescope = { style = "borderless" }, -- Отключает рамку для Telescope
		statusline = { -- Настройки строки состояния
			enabled = true, -- Включает строку состояния
			theme = "default", -- Устанавливает тему для строки состояния
			separator_style = "default", -- Определяет стиль разделителя
		},
		tabufline = { -- Настройки линии вкладок
			enabled = true, -- Включает панель вкладок
			lazyload = true, -- Ленивая загрузка для оптимизации
			order = { "treeOffset", "buffers", "tabs", "btns" }, -- Устанавливает порядок элементов
		},
	},

	-- Настройки nvdash, который отображается при запуске Neovim
	nvdash = {
		load_on_startup = true, -- Загружает nvdash при старте Neovim
		header = { -- Текст заголовка в виде ASCII-графики
			" █████   █    ██  ▄▄▄        ██████  ▄▄▄       ██▀███  ",
			"▒██▓  ██▒ ██  ▓██▒▒████▄    ▒██    ▒ ▒████▄    ▓██ ▒ ██▒",
			"▒██▒  ██░▓██  ▒██░▒██  ▀█▄  ░ ▓██▄   ▒██  ▀█▄  ▓██ ░▄█ ▒",
			"░██  █▀ ░▓▓█  ░██░░██▄▄▄▄██   ▒   ██▒░██▄▄▄▄██ ▒██▀▀█▄  ",
			"░▒███▒█▄ ▒▒█████▓  ▓█   ▓██▒▒██████▒▒ ▓█   ▓██▒░██▓ ▒██▒",
			"░░ ▒▒░ ▒ ░▒▓▒ ▒ ▒  ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░",
			" ░ ▒░  ░ ░░▒░ ░ ░   ▒   ▒▒ ░░ ░▒  ░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░",
			"   ░   ░  ░░░ ░ ░   ░   ▒   ░  ░  ░    ░   ▒     ░░   ░ ",
			"    ░       ░           ░  ░      ░        ░  ░   ░     ",
			" ",
			" ",
			" ",
			" ",
			" ",
		},
		buttons = { -- Кнопки для быстрого доступа к командам
			{ txt = "  Find Files", keys = "ff", cmd = "Telescope find_files" },
			{ txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
			{ txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
			{ txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
			{ txt = "  Sessions", keys = "ss", cmd = "SessionManager load_session" },
			{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
			{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true }, -- Разделитель
			{
				txt = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime) .. " ms"
					return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
				end,
				hl = "NvDashFooter",
				no_gap = true,
			},
			{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
		},
	},

	-- Настройки терминала
	term = {
		winopts = { number = false, relativenumber = false }, -- Отключает номера строк для терминала
		sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 }, -- Размеры для разделений экрана
		float = { -- Плавающее окно для терминала
			relative = "editor",
			row = 0.3,
			col = 0.25,
			width = 0.5,
			height = 0.4,
			border = "single", -- Одинарная рамка
		},
	},

	-- Настройки LSP
	lsp = { signature = true }, -- Включает отображение сигнатуры функции при работе с LSP

	-- Настройки для cheatsheet (шпаргалки)
	cheatsheet = {
		theme = "grid", -- Устанавливает сеточную тему
		-- excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },  -- Группы, исключаемые из списка
	},

	-- Настройки для Mason (пакетного менеджера)
	mason = {
		pkgs = {
			"basedpyright",
			"google-java-format",
			"clang-format",
			"cpplint",
			"clangd",
			"yapf",
			"black",
			"mypy",
			"ruff",
			"prettier",
		},
		skip = {},
	}, -- Определяет пакеты для установки и пропуска

	-- Настройки для colorify (подсветки цветов)
	colorify = {
		enabled = true, -- Включает подсветку цветов
		mode = "virtual", -- Виртуальный режим подсветки
		virt_text = "󱓻 ", -- Текст и иконка для подсветки
		highlight = { hex = true, lspvars = true }, -- Включает подсветку hex-значений и переменных LSP
	},
}

-- Безопасная попытка загрузки файла "chadrc.lua" для расширения настроек
local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
