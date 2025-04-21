-- https://github.com/nvim-treesitter/nvim-treesitter-context

return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            -- Modularizing the configuration by using an object
            local M = {}

            -- Default configuration
            M.config = {
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
            }

            -- Setup function to initialize the plugin with the config
            M.setup = function()
                require('treesitter-context').setup(M.config)
            end

            -- Call setup to initialize the plugin
            M.setup()
        end,
    },
}

