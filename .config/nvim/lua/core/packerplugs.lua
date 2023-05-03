-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  --- add other use .. for other packs --- 
--  use {
--    "folke/which-key.nvim",
--    config = function()
--      vim.o.timeout = true
--      vim.o.timeoutlen = true
--      require("which-key").setup {}
--    end
--  }
--
--  use {
--  'nvim-treesitter/nvim-treesitter',
--  'lewis6991/spellsitter.nvim',
--  }
--
--  use {
--    'goolord/alpha-nvim',
--    requires = { 'nvim-tree/nvim-web-devicons' },
--    config = function ()
--        require'alpha'.setup(require'alpha.themes.startify'.config)
--    end
--  }
--
--  use 'folke/tokyonight.nvim'
--  use 'jiangmiao/auto-pairs'
--
--  use 'itchyny/lightline.vim'
--  use 'norcalli/nvim-colorizer.lua'
--  require('colorizer').setup()
  
end)


