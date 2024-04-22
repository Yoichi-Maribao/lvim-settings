-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.leader = " "
lvim.keys.normal_mode["<C-t>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<leader>d"] = ":bd<CR>"
lvim.transparent_window = true
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- plugins
lvim.plugins = {
  { "machakann/vim-sandwich" }
}

-- LSP
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "angularls"
end, lvim.lsp.automatic_configuration.skipped_servers)

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- config
lvim.format_on_save = true
