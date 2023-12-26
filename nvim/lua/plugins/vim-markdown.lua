return {
  'plasticboy/vim-markdown',
  branch = 'master',
  require = {'godlygeek/tabular'},
  config = function()
    vim.g.vim_markdown_folding_disabled = 1
  end
}
