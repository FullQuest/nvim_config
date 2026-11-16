return {
  'nvim-mini/mini.indentscope',
  version = '*',
  -- opts как функция: код внутри выполнится, когда плагин уже загружен
  opts = function()
    return {
      draw = {
        delay = 100,
        animation = require('mini.indentscope').gen_animation.quadratic({
          easing = 'out',
          duration = 500,
          unit = 'total',
        }),
        predicate = function(scope) return not scope.body.is_incomplete end,
        priority = 2,
      },
      mappings = {
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        goto_top = '[i',
        goto_bottom = ']i',
      },
      options = {
        border = 'both',
        indent_at_cursor = true,
        n_lines = 10000,
        try_as_border = false,
      },
      symbol = '│',
      -- symbol = '╎',
    }
  end,
}
