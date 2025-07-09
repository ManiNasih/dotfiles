return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>fo",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "[F][o]rmat buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            rust = { "rustfmt", lsp_format = "fallback" },

            -- Set default formatters for unset filetypes
            ["_"] = { "prettierd", "prettier", stop_after_first = true },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- To setup auto formatting on save uncomment the line below
        -- format_on_save = { timeout_ms = 500 },
    },
}
