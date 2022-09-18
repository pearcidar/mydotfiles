-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)
vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
	use { "wbthomason/packer.nvim" } -- let packer manage itself
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
