return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function() require("todo-comments").setup() end,
  },
  {
    "vinicius507/header42.nvim",
    config = function()
      require("header42").setup {
        login = "bcorrea-",
        email = "bruuh.cor@gmail.com",
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function() require("zen-mode").setup() end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 10,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "tab",
      float_ops = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
      start_in_insert = true,
    },
  },
}
