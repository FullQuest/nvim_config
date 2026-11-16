require("config.lazy")

-- Файл: ~/.config/nvim/init.lua (или в lua/lsp.lua)
vim.lsp.config.clangd = {
    cmd = { 'clangd', '--clang-tidy', '--background-index', '--offset-encoding=utf-8' },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },
}
vim.lsp.enable('clangd')


-- Настраиваем сервер ts_ls (TypeScript/React)
-- Мы расширяем конфигурацию по умолчанию, которую предоставляет nvim-lspconfig
vim.lsp.config('typescript-language-server', {
  -- filetypes определяет, для каких типов файлов запускать сервер
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  -- root_markers помогают Neovim понять, где находится корень проекта
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  -- Здесь можно добавить пользовательские настройки, например, для inlay hints
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

-- Включаем сервер(ы). Это ключевой шаг, который запускает LSP.
vim.lsp.enable('typescript-language-server')

-- Если вы также установили eslint, его можно включить так:
-- vim.lsp.enable('eslint')




vim.lsp.config('basedpyright', {
    -- Запускаем сервер внутри контейнера через docker exec.
    -- Замените "my-python-container" на реальное имя или ID вашего контейнера.
    -- cmd = {
    --     'docker', 'exec', '-i', 'api',
    --     'basedpyright-langserver', '--stdio'
    -- },
    cmd = {
         'basedpyright-langserver', '--stdio'
    },

    -- Маркеры, по которым Neovim будет определять корень проекта.
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        '.git',
    },

    filetypes = { 'python' },

    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
                autoImportCompletions = true,
                -- logLevel = 'Trace',
            },
            disableOrganizeImports = true,
        },
        python = {
            pythonPath = "/Users/fq/soft/dev/app/venv/bin/python",
        },
    },
})

-- Активируем сервер
vim.lsp.enable('basedpyright')



vim.opt.splitkeep = 'screen'
vim.o.equalalways = false





-- Объединяем стандартные возможности LSP (и nvim-cmp, если установлен)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Обязательно для отслеживания новых заметок и ссылок
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

vim.lsp.config('markdown_oxide', {
  capabilities = capabilities,
})

vim.lsp.enable('markdown_oxide')







-- Включаем LSP-сервер для C и C++ файлов

-- vim.api.nvim_set_keymap('n', '<C-/>', 'gcc', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<C-/>', 'gc', {noremap = true, silent = true})

vim.opt.number = true


vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'see error' })

vim.opt.exrc = true      -- разрешить .nvim.lua в текущей папке
vim.opt.secure = true    -- спрашивать подтверждение для потенциально опасных команд (рекомендуется)

vim.opt.tabstop = 4      -- Visual width of a tab
vim.opt.softtabstop = 4  -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 4   -- Size of an indent
vim.opt.expandtab = true  -- Use spaces instead of tabs

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)


-- Увеличение/уменьшение ширины на 5 колонок за раз
vim.keymap.set('n', '<A-h>', '<Cmd>vertical resize -5<CR>')
vim.keymap.set('n', '<A-l>', '<Cmd>vertical resize +5<CR>')

-- Увеличение/уменьшение высоты на 5 строк за раз
vim.keymap.set('n', '<A-j>', '<Cmd>resize -5<CR>')
vim.keymap.set('n', '<A-k>', '<Cmd>resize +5<CR>')


vim.keymap.set('n', '<C-h>', '<C-w>h') -- Влево
vim.keymap.set('n', '<C-j>', '<C-w>j') -- Вниз
vim.keymap.set('n', '<C-k>', '<C-w>k') -- Вверх
vim.keymap.set('n', '<C-l>', '<C-w>l') -- Вправо


