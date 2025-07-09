return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        animate = { enabled = true },
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        debug = { enabled = true },
        dim = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },
        scroll = { enabled = true },
    },
    keys = {

        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazy[g]it",
        },
    },
}
