-- The following line is commented to unmap default nvchad mappings
-- require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Move Selection
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

-- Center scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Escape with jk
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Save buffer
map("n", "<C-s>", ":wa<CR>", { desc = "Save buffer", silent = true })
map("n", "<leader>w", ":wa<CR>", { desc = "Save buffer", silent = true })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit", silent = true })
map("n", "<leader>Q", ":q!<CR>", { desc = "Force Quit", silent = true })

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
map("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

-- Comment block
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- Toggle explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })

-- Telescope
local builtin = require "telescope.builtin"
map("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
map("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
map("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
map("n", "<leader>sw", builtin.grep_string, { desc = "Search Current Word" })
map("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
map("n", "<leader>s.", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
map("n", "<leader>sc", "<cmd>Telescope themes<CR>", { desc = "Search Colorschemes" })

-- Todo Telescope
map("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Search ToDos" })

-- Persistence
map("n", "<leader>Sc", "<cmd>SessionLoad<CR>", { desc = "Restore Current Dir" })
map("n", "<leader>Sr", "<cmd>SessionLoadLast<CR>", { desc = "Restore Last Session" })
map("n", "<leader>Ss", "<cmd>SessionStop<CR>", { desc = "Stop Session" })
map("n", "<leader>Sl", "<cmd>Telescope persisted<CR>", { desc = "List Sessions" })
