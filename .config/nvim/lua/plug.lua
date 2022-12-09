-- [[ plug.lua ]]

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  use({
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      theme_style = "dark",
      function_style = "italic",
      comment_style = "italic",
      keyword_style = "bold",
      variable_style = "italic",
      sidebars = {"qf", "vista_kind", "terminal", "packer"},
      transparent=true,
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      colors = {hint = "orange", error = "#ff0000"},
      dark_float=true,

      -- Overwrite the highlight groups
      overrides = function(c)
      return {
        htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
        DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
        -- this will remove the highlight groups
        TSField = {},
      }
     end
    })
  end
  })
  
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
   -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
 
  use {
  'nvim-tree/nvim-tree.lua',
   requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
   },
   tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
end)

