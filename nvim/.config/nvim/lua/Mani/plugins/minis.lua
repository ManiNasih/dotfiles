return {
    {
        "echasnovski/mini.files",
        version = false,
        keys = {
            {
                "<leader>oe",
                function()
                    MiniFiles.open()
                end,
                desc = "[E]xplorer",
            },
        },
        opts = {
            options = {
                use_as_default_explorer = false,
            },
        },
    },
    {
        "echasnovski/mini.surround",
        version = false,
        opts = {},
    },
    { "echasnovski/mini.statusline", version = false, opts = {} },
}
