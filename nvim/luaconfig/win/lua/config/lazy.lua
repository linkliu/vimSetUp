
-- Bootstrap lazy.nvim
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

-- Setup lazy.nvim
require("lazy").setup({
    --主题snokai
    {"sainnhe/sonokai"},
	--一个超快(Blazingly Fast!)的状态栏美化插件
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	-- 文件管理器
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- 代码语法高亮，支持多种语言
	{ "nvim-treesitter/nvim-treesitter" },
	-- 代码块缩进显示插件
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({})
		end,
	},
	-- 平滑滚动插件
	{ "karb94/neoscroll.nvim" },

	-- 显示git里增加，删除，编辑地方
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- 一个超快的显示hex颜色的插件
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- 在文件顶部显示目前函数名
	{ "nvim-treesitter/nvim-treesitter-context" },

	-- 光标位于一个词语时，页面上其他同一个词语加下划线
	{ "RRethy/vim-illuminate" },

	--coc.nvim
	{"neoclide/coc.nvim"},

	{'vim-airline/vim-airline'},

	{'vim-airline/vim-airline-themes'},

	--nvim-dap 调试插件
	{'mfussenegger/nvim-dap'}
})
local cmd = vim.cmd

cmd.colorscheme("sonokai")
