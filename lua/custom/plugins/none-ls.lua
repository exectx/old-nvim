return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      debug = true,
      sources = {
        null_ls.builtins.formatting.latexindent, -- latex
        null_ls.builtins.code_actions.eslint_d, -- js
        null_ls.builtins.diagnostics.eslint_d, -- js
        null_ls.builtins.formatting.prettier, -- js
      },
    }
  end,
}
