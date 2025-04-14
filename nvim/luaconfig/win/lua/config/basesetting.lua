local set         = vim.opt
local cmd         = vim.cmd
local o           = vim.o
local g           = vim.g
local bo          = vim.bo
local map         = vim.api.nvim_set_keymap
-- 编码方式 utf8
g.encoding        = "UTF-8"
g.langmenu        = "en_US"
g.fileencodings   = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"
g.fileencoding    = "utf-8"

o.number          = true
o.tabstop         = 4
o.softtabstop     = 4
o.shiftwidth      = 4
o.autoindent      = true

o.cursorline      = true
o.cursorcolumn    = true
o.signcolumn      = "yes"
o.sessionoptions  = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
o.ignorecase      = true
o.fileformats     = "unix"
o.fileformat      = "unix"
o.wrap            = false

set.termguicolors = true
set.mouse:append("a")
set.clipboard:append("unnamedplus")
set.guifont = "JetBrainsMono Nerd Font:h12"

g.mapleader = ","
g.maplocalleader = ","
if g.neovide then
    vim.print(vim.g.neovide_version)
    g.neovide_no_idle         = true
    g.neovide_theme           = "dark"
    g.neovide_cursor_vfx_mode = "pixiedust"
    g.neovide_opacity = 0.98
    g.neovide_normal_opacity = 1
    g.neovide_title_background_color = string.format("%x",vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg)
    g.neovide_title_text_color = "white"
    g.neovide_cursor_animation_length = 0.3
    g.neovide_cursor_short_animation_length = 0.04
    g.neovide_cursor_trail_size = 1.0


end
