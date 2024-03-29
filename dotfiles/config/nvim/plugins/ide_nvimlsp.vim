" relevant plugins

" lsp specific config
#lua << EOF
  #local nvim_lsp = require'nvim_lsp'

  #local on_attach = function(_, bufnr)
    #vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    #require'diagnostic'.on_attach()
    #require'completion'.on_attach()

    #-- Mappings.
    #local opts = { noremap=true, silent=true }
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    #-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    #vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  #end

  #local servers = {'cssls', 'bashls', 'diagnosticls', 'dockerls', 'flow', 'ghcide', 'gopls', 'hie', 'html', 'intelephense', 'tsserver', 'jsonls', 'kotlin_language_server', 'pyls', 'rust_analyzer', 'sourcekit', 'vimls', 'vuels'}
  #for _, lsp in ipairs(local_servers) do
    #nvim_lsp[lsp].setup {
      #on_attach = on_attach,
    #}
  #end
#EOF
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_fuzzy_match = 1
let g:diagnostic_enable_virtual_text = 1

" fix conflict between completion-nvim and autopairs
let g:completion_confirm_key = ""
inoremap <expr> <cr>    pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"
