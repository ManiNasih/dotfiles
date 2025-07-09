return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spec = {
            { "g", group = "[G]oto" },
            { "<leader>f", group = "[F]ind" },
            { "<leader>g", group = "[G]it" },
            { "<leader>gh", group = "[H]unk" },
            { "<leader>gd", group = "[D]iff" },
            { "<leader>gt", group = "[T]ggle" },
            { "<leader>fs", group = "[S]ymbols" },
            { "<leader>c", group = "[C]ode" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>o", group = "[O]pen" },
            { "<leader>r", group = "[R]eplace" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
