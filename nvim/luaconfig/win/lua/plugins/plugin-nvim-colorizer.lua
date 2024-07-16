--颜色采样器
return {
    "norcalli/nvim-colorizer.lua",
    config = function ()
        require("colorizer").setup({
            "*",
        })
    end
}