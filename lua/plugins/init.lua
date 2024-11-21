return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = require "configs.nvim-treesitter",
	},

	{
		-- Автоформатинг и т.д
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufReadPre", "BufNewFile" },
		opts = require "configs.conform",
	},

	{
		-- GIT интеграция
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns").setup()
		end,
	},
	{
		-- Линтинг
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("configs.lint").setup()
		end,
	},

	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("inlay-hints").setup {
				commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
				autocmd = { enable = true },
			}
		end,
	},

	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		config = function() end,
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
	},

	{
		"nvim-java/nvim-java",
		lazy = true,
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
		config = function()
			require("java").setup {}
			require("lspconfig").jdtls.setup {}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require "configs.lspconfig"
		end,
	},

	{ "nvim-neotest/nvim-nio" }, -- Зависимость?
	-- Украшательства
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy", -- Плагин будет загружен только при необходимости
		opts = {
			-- Здесь можно добавить дополнительные настройки, если нужно
		},
		dependencies = {
			"MunifTanjim/nui.nvim", -- Обязательная зависимость для noice
			"rcarriga/nvim-notify", -- Опциональная зависимость для уведомлений
		},
		config = function()
			-- Настройка noice
			require("configs.noice").setup()
		end,
	},

	{
		-- Красивая табуляция
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	{
		-- Красивые менюшки для различных действий
		"stevearc/dressing.nvim",
		lazy = false,
		opts = {},
	},

	{
		-- Менеджер сессий
		"Shatur/neovim-session-manager",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.nvim-session-manager").setup()
		end,
	},
}
