return {
    "folke/tokyonight.nvim",
    lazy = false,      -- тема загружается сразу
    priority = 1000,   -- высший приоритет
    opts = {
        style = "night"   -- тёмная версия (tokyonight-night)
    },
    config = function(_, opts)
        -- применить настройки
        require("tokyonight").setup(opts)
        -- активировать тему
        vim.cmd("colorscheme tokyonight-night")
    end
}
