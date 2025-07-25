-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.guess-indent',
  require 'plugins.gitsigns',
  -- require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lsp.lazydev',
  require 'plugins.lsp.lspconfig',
  require 'plugins.conform',
  require 'plugins.blink',
  require 'plugins.themes.vscode',
  require 'plugins.themes.todo',
  require 'plugins.mini',
  require 'plugins.treesitter',
  -- require 'plugins.debug',
  -- require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
  require 'plugins.gitsigns',
  require 'plugins.lsp.go',
  -- { import = 'plugins' },
}, {
  ui = { icons = vim.g.have_nerd_font and {} },
})
