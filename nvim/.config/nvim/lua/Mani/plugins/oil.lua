return {
    "stevearc/oil.nvim",
    keys = {
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open parent directory" }),
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true,

        keymaps = {
            ["q"] = "actions.close",
        },

        view_options = {
            show_hidden = true,
        },

        skip_confirm_for_simple_edits = true,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
}
