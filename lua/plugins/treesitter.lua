return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "cpp", "lua" },
    highlight = { enable = true },
  },
  -- явно делаем плагин не ленивым, чтобы настройки применились при старте
  lazy = false,
}
