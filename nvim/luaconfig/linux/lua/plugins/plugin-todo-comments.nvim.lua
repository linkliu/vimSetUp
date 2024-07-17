--待办插件
return {
    "folke/todo-comments.nvim",
    ft = { "lua", "cpp", "c", "rust", "typescript" },
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
        require("todo-comments").setup({
            --
        })
    end
}
