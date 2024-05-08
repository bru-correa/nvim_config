return {
  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   opts = {
  --     notify_on_error = false,
  --     format_on_save = function(bufnr)
  --       -- Disable "format_on_save lsp_fallback" for languages that don't
  --       -- have a well standardized coding style. You can add additional
  --       -- languages here or re-enable it for the disabled ones.
  --       local disable_filetypes = { c = true, cpp = true }
  --       return {
  --         timeout_ms = 500,
  --         lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
  --         async = false,
  --       }
  --     end,
  --     formatters_by_ft = {
  --       lua = { 'stylua' },
  --       javascript = { 'prettier' },
  --       javascriptreact = { 'prettier' },
  --       typescript = { 'prettier' },
  --       typecriptreact = { 'prettier' },
  --       html = { 'prettier' },
  --       css = { 'prettier' },
  --       scss = { 'prettier' },
  --       less = { 'prettier' },
  --       json = { 'prettier' },
  --       jsonc = { 'prettier' },
  --       yaml = { 'prettier' },
  --       markdown = { 'prettier' },
  --       -- Conform can also run multiple formatters sequentially
  --       -- python = { "isort", "black" },
  --       --
  --       -- You can use a sub-list to tell conform to run *until* a formatter
  --       -- is found.
  --       -- javascript = { { "prettierd", "prettier" } },
  --     },
  --   },
  -- },
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'
      conform.setup {

        formatters_by_ft = {
          lua = { 'stylua' },
          ['javascript'] = { 'prettier' },
          ['javascriptreact'] = { 'prettier' },
          ['typescript'] = { 'prettier' },
          ['typescriptreact'] = { 'prettier' },
          ['vue'] = { 'prettier' },
          ['css'] = { 'prettier' },
          ['scss'] = { 'prettier' },
          ['less'] = { 'prettier' },
          ['html'] = { 'prettier' },
          ['json'] = { 'prettier' },
          ['jsonc'] = { 'prettier' },
          ['yaml'] = { 'prettier' },
          ['markdown'] = { 'prettier' },
          ['markdown.mdx'] = { 'prettier' },
          ['graphql'] = { 'prettier' },
          ['handlebars'] = { 'prettier' },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use a sub-list to tell conform to run *until* a formatter
          -- is found.
          -- javascript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          quiet = false,
          timeout_ms = 3000,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>lf', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        }
      end, { desc = 'Format file or range (in visual mode)' })
    end,
  },
}
