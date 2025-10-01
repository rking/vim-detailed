vim.api.nvim_create_autocmd('LspTokenUpdate', {
  callback = function(args)
    local token = args.data.token
    local syntax = vim.fn.synIDattr(vim.fn.synID(token.line, token.start_col, 0), 'name')
    -- hi link @lsp.type.method.ruby detailedControl
    if token.type == 'method' and syntax == 'rubyRoute' then
      vim.lsp.semantic_tokens.highlight_token(
        token, args.buf, args.data.client_id, 'rubyMacro'
      )
    end
    return false
  end,
})
