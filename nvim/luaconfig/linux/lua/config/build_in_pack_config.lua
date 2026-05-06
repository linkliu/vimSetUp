--emmylua_ls https://github.com/EmmyLuaLs/emmylua-analyzer-rust
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".emmyrc.json", ".luarc.json", ".git" },
})