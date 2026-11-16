return {
  'saghen/blink.cmp',
  -- Для Neovim 0.12+ обязательна библиотека blink.lib
  dependencies = {
    'saghen/blink.lib',
    -- -- Опционально: добавляет готовые сниппеты для источника 'snippets'
    -- 'rafamadriz/friendly-snippets',
  },
  -- Используем тег версии, чтобы скачивать предсобранный бинарник
  version = '1.*', -- или 'v0.*' в зависимости от актуального стабильного тега
  
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- Пресет 'default' повторяет привычные клавиши (C-y для принятия)
    keymap = { preset = 'super-tab' },

    appearance = {
      -- 'mono' для Nerd Font Mono, 'normal' для обычного Nerd Font
      nerd_font_variant = 'mono',
    },

    completion = {
      -- Показывать документацию только по запросу (по умолчанию)
      documentation = { auto_show = false },
    },

    sources = {
      -- 'lsp', 'path', 'snippets', 'buffer' включены по умолчанию
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- Использовать Rust-реализацию с откатом на Lua при недоступности
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },

  -- Позволяет расширять список источников в других частях конфига
  opts_extend = { 'sources.default' },
}
