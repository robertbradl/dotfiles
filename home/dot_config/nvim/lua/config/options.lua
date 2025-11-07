-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.g.lazyvim_rust_analyzer_settings = {
  cargo = { allFeatures = true },
  checkOnSave = { command = "clippy" },
  procMacro = { enable = true },
}

vim.g.lazyvim_rust_tools = {
  inlay_hints = {
    auto = true,
    show_parameter_hints = true,
    parameter_hints_prefix = "<- ",
    other_hints_prefix = "=> ",
  },
  hover_actions = {
    auto_focus = true,
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local map = vim.keymap.set
    map("n", "K", function()
      vim.cmd.RustLsp("hover actions")
    end, { buffer = bufnr, silent = true })
    map("n", "<leader>rr", function()
      vim.cmd.RustLsp("runnables")
    end, { buffer = bufnr })
    map("n", "<leader>rd", function()
      vim.cmd.RustLsp("debuggables")
    end, { buffer = bufnr })
  end,
})
