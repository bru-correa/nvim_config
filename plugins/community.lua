return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  {
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
    },
  },
  -- {
  --   import = "astrocommunity.editing-support.zen-mode-nvim",
  --   opts = {
  --     window = {
  --       width = 120,
  --       options = {
  --         signcolumn = "yes",
  --         number = true,
  --         relativenumber = true,
  --         cursorline = true,
  --         cursorcolumn = true,
  --         foldcolumn = "2",
  --         list = true,
  --       },
  --     },
  --   },
  -- },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
