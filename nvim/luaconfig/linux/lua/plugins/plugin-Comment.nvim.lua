--代码注释插件
return -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
{
    'numToStr/Comment.nvim',
    lazy = false,
    config = function ()
        require("Comment").setup()
    end
}
