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
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     config = function(_, opts)
    --         require("lsp_signature").setup(require "configs.conform")
    --     end,
    -- },

    {
        "neovim/nvim-lspconfig",
        event = { "BufNewFile", "BufReadPre" },
        config = function()
            require "configs.lspconfig"
        end,
    },

    { "nvim-neotest/nvim-nio" }, -- Зависимость?
    -- Украшательства
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
