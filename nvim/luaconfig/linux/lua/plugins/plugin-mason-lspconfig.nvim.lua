--mason 和 nvim-lspconfig 的桥梁插件，安装和配置 lsp 服务器
return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            "lua_ls",
            -- "gdscript",
            -- "clangd",
            -- "rust_analyzer",
        },
        automatic_enable = {
            "lua_ls",
            exclude = { 

            },
        },
    },
}
