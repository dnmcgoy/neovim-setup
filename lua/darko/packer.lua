-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'catppuccin/nvim',
	  as = 'catppuccin',
	  config = function()
		  vim.cmd('colorscheme catppuccin')
	  end
  })

  vim.cmd('colorscheme catppuccin')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
              {'neovim/nvim-lspconfig'},             -- Required
              {                                      -- Optional
              'williamboman/mason.nvim',
              run = function()
                  pcall(vim.cmd, 'MasonUpdate')
              end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Optional
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }
  use('github/copilot.vim')
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui')
  use('leoluz/nvim-dap-go')
  use('theHamsta/nvim-dap-virtual-text')
  use { 'nvim-tree/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use('rcarriga/nvim-notify')
end)
