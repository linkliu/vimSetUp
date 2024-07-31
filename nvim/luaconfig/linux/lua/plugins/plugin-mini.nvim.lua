return {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()
        require("mini.align").setup()
        require("mini.icons").setup()
        require("mini.notify").setup()
    end

}
