
-- Bootstrap lazy.nvim
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- Setup lazy.nvim
--require("lazy").setup({
--   
--
--
--
--	-- 代码块缩进显示插
--	{
--		"lukas-reineke/indent-blankline.nvim",
--		config = function()
--			require("ibl").setup({})
--		end,
--	},
--	-- 平滑滚动插件
--	{ "karb94/neoscroll.nvim" },
--
--	-- 显示git里增加，删除，编辑地方
--	{
--		"lewis6991/gitsigns.nvim",
--		config = function()
--			require("gitsigns").setup()
--		end,
--	},
--
--	-- 一个超快的显示hex颜色的插件
--	{
--		"norcalli/nvim-colorizer.lua",
--		config = function()
--			require("colorizer").setup()
--		end,
--	},
--
--	-- 在文件顶部显示目前函数名
--	{ "nvim-treesitter/nvim-treesitter-context" },
--
--	-- 光标位于一个词语时，页面上其他同一个词语加下划线
--	{ "RRethy/vim-illuminate" },
--})
--
--local cmd = vim.cmd
--
--cmd.colorscheme("sonokai")


