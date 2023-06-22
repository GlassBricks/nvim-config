--local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },
    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    { "easymotion/vim-easymotion", keys = "<SP><SP>" },
    { "tpope/vim-fugitive", lazy = false },
    { "mbbill/undotree", lazy = false },

    { "tpope/vim-surround", lazy = false },
    { "vim-scripts/ReplaceWithRegister", keys = "gr" },
    { "vim-scripts/argtextobj.vim", lazy = false },
    {
        "kana/vim-textobj-entire",
        lazy = false,
        dependencies = {
            "kana/vim-textobj-user",
        },
    },
    { "machakann/vim-highlightedyank", lazy = false },
    { "dbakker/vim-paragraph-motion", keys = { "{", "}" } },
    { "michaeljsmith/vim-indent-object", keys = { "ai", "aI", "ii", "iI" } },

    { "tpope/vim-repeat", lazy = false },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup {
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-j>",
                        accept_line = "<C-S-j>",
                        next = "<M-.>",
                        prev = "<M-,>",
                        dismiss = "<M-k>",
                    },
                },
            }
        end,
    },
}

return plugins
