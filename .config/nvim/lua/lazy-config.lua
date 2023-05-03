local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Added this line to our initial lazy-config.lua file (Remove this comment if you want to)

local plugins = {
  { import = "plugins" },
}

local opts = {
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "man",
                "tarPlugin",
                "zipPlugin",
            },
        },
    },
}

require("lazy").setup(plugins, opts)
require'colorizer'.setup()
require('custom.evilua')
