return {
  "folke/persistence.nvim",
  event = "VimEnter",
  opts = {
    need = 1,
      dir = vim.fn.stdpath("state") .. "/sessions/",
      -- Восстановить последнюю сессию при старте
      load_last = true,
      -- Сохранять при выходе
      save_on_exit = true,
      -- опционально: исключить некоторые filetypes из сохранения
      -- excluded = {},
  },
  config = function(_, opts)
    require("persistence").setup(opts)

    -- Автосохранение сессии перед выходом
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        require("persistence").save()
      end,
    })

    -- Автовосстановление последней сессии при старте
    --if vim.fn.argc() == 0 then -- только если nvim открыт без файлов
    --  require("persistence").load({ last = true })
    --end
  end,
} 
