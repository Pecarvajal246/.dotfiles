local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettierd,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.djlint,
    diagnostics.djlint,
    -- diagnostics.flake8,
  },
on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
  end,
}

