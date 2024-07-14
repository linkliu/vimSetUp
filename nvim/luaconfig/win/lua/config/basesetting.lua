local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local g = vim.g
local bo = vim.bo
local map = vim.api.nvim_set_keymap
-- 编码方式 utf8
g.encoding = "UTF-8"
g.nocompatible = true
g.langmenu = "en_US"
g.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"
g.fileencoding = "utf-8"
g.fileformat="unix"

o.number = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

o.cursorline = true
o.cursorcolumn = true
o.signcolumn  = "yes"

set.termguicolors = true