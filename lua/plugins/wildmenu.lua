return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })

    -- Встроенный пайплайн с обычным wildmenu (без внешних fuzzy-фильтров)
    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 0,            -- отключаем fuzzy, если не нужен (или 1 для встроенного)
        }),
        wilder.vim_search_pipeline()
      ),
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = { border = "Normal" },
          border = "rounded",
        })
      )
    )
  end,
}
