local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Функции для ruff и basedpyright
lspconfig.ruff.setup {
	on_attach = function(client, bufnr)
		client.server_capabilities.hoverProvider = false
		nvlsp.on_attach(client, bufnr) -- Используем on_attach из nvchad
	end,
	init_options = {
		settings = {
			lint = {
				enable = false, -- Отключаем lint (Используем lint.nvim)
			},
		},
	},
}

lspconfig.basedpyright.setup {
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	settings = require "configs.basedpyright",
}

lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--background-index", -- Индексирование проекта в фоновом режиме
		"--clang-tidy", -- Включение clang-tidy
		"--completion-style=detailed", -- Подробное автодополнение
		"--offset-encoding=utf-16", -- Важно для правильной работы с кодировками
		"--fallback-style=llvm", -- Стиль форматирования кода (LLVM)
		"--header-insertion=iwyu", -- Использование IWYU для заголовочных файлов
		"--function-arg-placeholders", -- Автозаполнение для аргументов функции
		"--enable-config", -- Включение конфигурационных файлов
	},
	root_dir = function(fname)
		-- Определяет корневую директорию на основе файлов проекта
		return require("lspconfig.util").root_pattern("Makefile", "configure.ac", "CMakeLists.txt", ".git")(fname)
			or vim.fn.getcwd() -- Если не найдено, возвращаем текущую директорию
	end,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		nvlsp.on_attach(client, bufnr)
	end,
	on_init = nvlsp.on_init,
	capabilities = vim.tbl_extend("force", nvlsp.capabilities or {}, {
		offsetEncoding = { "utf-16" }, -- Указывает, что кодировка исходного кода - UTF-16
	}),
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
}

-- EXAMPLE: Устанавливаем другие LSP серверы с дефолтной настройкой
local servers = { "lua_ls", "html", "cssls" }
-- Настройка LSP с дефолтной конфигурацией для других серверов
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
end
