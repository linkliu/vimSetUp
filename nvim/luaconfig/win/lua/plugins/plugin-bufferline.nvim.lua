--buffer 顶部条
return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        require("bufferline").setup()
    end
}
