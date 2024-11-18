local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Функции для ruff и basedpyright
local function ruff()
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
end

local function basedpyright()
	lspconfig.basedpyright.setup {
		on_attach = nvlsp.on_attach,
		capabilities = nvlsp.capabilities,
		settings = require "configs.basedpyright",
	}
end

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

-- Настройка ruff и basedpyright
basedpyright()
ruff()
