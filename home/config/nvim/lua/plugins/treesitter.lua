return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    ts.install({
      "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "nix", "python"
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })
  end,
}

