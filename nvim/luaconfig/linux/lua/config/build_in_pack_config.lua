--emmylua_ls https://github.com/EmmyLuaLs/emmylua-analyzer-rust
vim.lsp.config("emmylua_ls", {
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = { ".emmyrc.json", ".luarc.json", ".git" },
})

vim.lsp.config("csharp_ls", {
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  -- get_language_id = require("../lsp/csharp_ls.lua"),
  init_options = {
    AutomaticWorkspaceInit = true
  },
  -- root_dir = require("../lsp/csharp_ls.lua")
})

vim.lsp.config("csharpier", {
  cmd = {"csharpier"},
  filetypes = { "cs" },
})
