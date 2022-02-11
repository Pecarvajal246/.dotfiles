local nvim_lsp = require('lspconfig')

vim.diagnostic.config({virtual_text = false})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- client.resolved_capabilities.document_formatting = false
  -- client.resolved_capabilities.document_range_formatting = false
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  
  -- formatting
  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  --   vim.api.nvim_command [[augroup END]]
  -- end
   -- highlighting
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command [[augroup lsp_document_highlight]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- Setup nvim-cmp.

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)
      end
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	['<Tab>'] = function(fallback)
	      if cmp.visible() then
		cmp.select_next_item()
	      else
		fallback()
	      end
	    end
	},
    sources = {
      { name = 'nvim_lsp' },
      { name = "neorg" },
      { name = 'buffer' },
      { name = 'luasnip' },
    }
  })
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pylsp'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = on_attach,
	}
end
  -- null-ls init
require("null-ls").setup({
    -- you must define at least one source for the plugin to work
	sources = { require("null-ls").builtins.formatting.black.with({
		prefer_local = true
	}) },
	on_attach = on_attach
})
