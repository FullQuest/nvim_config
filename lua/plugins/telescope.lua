return {
  'nvim-telescope/telescope.nvim',
  version = '*',                          -- стабильная версия
  dependencies = {
      'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')  -- <-- ЭТО БЫЛО ПРОПУЩЕНО
    -- telescope.setup({})                   -- стандартные настройки без дополнений
    telescope.setup({
      defaults = {
        mappings = {
          i = {  -- insert mode (когда вы печатаете запрос)
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep,   { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers,     { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags,   { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles,    { desc = 'Recent files' })
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references,    { desc = 'Recent files' })
  end,
}
