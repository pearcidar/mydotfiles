local bo = vim.bo
local go = vim.o
local wo = vim.wo
local opt = vim.opt

bo.expandtab = true
bo.shiftwidth = 2

bo.softtabstop = 2
go.termguicolors = true
go.t_Co=256
wo.relativenumber = true
wo.number = true

opt.showmode = false
