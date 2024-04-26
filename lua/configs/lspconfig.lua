-- local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Setup neodev
require("neodev").setup {}

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "lua_ls", "clangd", "dockerls", "docker_compose_language_service" }

local map = vim.keymap.set

local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Lsp Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Lsp Go to definition")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "gi", vim.lsp.buf.implementation, opts "Lsp Go to implementation")
  map("n", "<leader>ls", vim.lsp.buf.signature_help, opts "Lsp Show signature help")
  map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

  map("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  map("n", "<leader>lD", vim.lsp.buf.type_definition, opts "Lsp Go to type definition")

  map("n", "<leader>lr", function()
    require "nvchad.lsp.renamer"()
  end, opts "Lsp NvRenamer")

  map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts "Lsp Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Lsp Show references")

  -- setup signature popup
  if require("nvconfig").ui.lsp.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
local exec_code_action = function(action)
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { action },
      diagnostics = {},
    },
  }
end

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    map("n", "<leader>lto", function()
      exec_code_action "source.addMissingImports.ts"
      vim.cmd "write"
      exec_code_action "source.removeUnusedImports.ts"
      vim.cmd "write"
      exec_code_action "source.sortImports.ts"
    end, { buffer = bufnr, desc = "Organize Imports" })

    map("n", "<leader>ltr", function()
      exec_code_action "source.removeUnused.ts"
    end, { buffer = bufnr, desc = "Remove Missing Imports" })

    map("n", "<leader>lta", function()
      exec_code_action "source.addMissingImports.ts"
    end, { buffer = bufnr, desc = "Add Missing Imports" })

    map("n", "<leader>lts", function()
      exec_code_action "source.organizeImports.ts"
    end, { buffer = bufnr, desc = "Sort Imports" })
  end,
  on_init = on_init,
  capabilities = capabilities,
}
