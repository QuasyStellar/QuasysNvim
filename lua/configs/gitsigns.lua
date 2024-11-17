local M = {}

M.setup = function()
    local gitsigns = require "gitsigns"

    -- Настройка gitsigns с использованием on_attach
    gitsigns.setup {
        on_attach = function(bufnr)
            -- Вспомогательная функция для назначения клавиш
            local function map(mode, lhs, rhs, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- Навигация по изменениям
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal { "]c", bang = true }
                else
                    gitsigns.next_hunk()
                end
            end, { desc = "Move to next hunk" })

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal { "[c", bang = true }
                else
                    gitsigns.prev_hunk()
                end
            end, { desc = "Move to previous hunk" })

            -- Действия
            map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage current hunk" })
            map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset current hunk" })
            map("v", "<leader>gs", function()
                gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
            end, { desc = "Stage selected hunk" })
            map("v", "<leader>gr", function()
                gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
            end, { desc = "Reset selected hunk" })
            map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
            map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo stage for current hunk" })
            map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
            map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview current hunk" })
            map("n", "<leader>gb", function()
                gitsigns.blame_line { full = true }
            end, { desc = "Show blame for current line" })
            map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame for current line" })
            map("n", "<leader>gd", gitsigns.diffthis, { desc = "Show diff for current file" })
            map("n", "<leader>gD", function()
                gitsigns.diffthis "~"
            end, { desc = "Show diff for current file against last commit" })
            map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle visibility of deleted lines" })

            -- Текстовые объекты
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk as a text object" })
        end,
    }
end

return M

