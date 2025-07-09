return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "<leader>gdn", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "[N]ext" })

                map("n", "<leader>gdp", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "[P]rev" })

                -- Actions
                map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "[S]tage" })
                map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "[R]eset" })

                map("v", "<leader>ghs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "[S]tage" })
                end)

                map("v", "<leader>ghr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "[R]eset" })
                end)

                map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "[S]tage buffer" })
                map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "[R]eset buffer" })
                map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "[P]review hunk" })
                map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview hunk [i]nline" })

                map("n",
                    "<leader>ghb",
                    function()
                    gitsigns.blame_line({ full = true })
                end,
                    { desc = "[B]lame line" })

                map("n", "<leader>ghd", gitsigns.diffthis, { desc = "[D]iff this" })

                -- Toggles
                map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Current line [b]lame" })
                map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "[W]ord diff" })
            end,
        })
    end,
}
