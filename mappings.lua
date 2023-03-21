-- Mapping data with "desc" stored directly by vim.keymap.set().

-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

-- first key is the mode
-- second key is the lefthand side of the map
-- mappings seen under group name "Buffer"
-- tables with the `name` key will be registered with which-key if it's installed
-- this is useful for naming menus

-- setting a mapping to false will disable it
-- ["<esc>"] = false,

local header = require("header42")
header.setup({
  login = "bcorrea",
  email = "bruuh.cor@gmail.com"
})

return {
  n = {
    -- Center the cursor after scrolling
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    -- Center the cursor after search
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    -- Managing Tabs
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer"
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- Toggle terminal
    ["<A-3>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<A-2>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
    ["<A-1>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    -- Header 42
    ["<leader>4"] = {
      function() require("header42.api").insert() end,
      desc = "Insert 42 header",
    }
  },
  t = {
    ["<A-3>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<A-2>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
    ["<A-1>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
  },
  i = {
    -- Insert tab char
    ["<C-l>"] = { "<C-v><Tab>" },
  }
}
