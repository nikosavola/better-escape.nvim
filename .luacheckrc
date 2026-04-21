-- Luacheck configuration for better-escape.nvim
-- See: https://luacheck.readthedocs.io/en/stable/config.html

-- Neovim exposes the `vim` global
std = "luajit"
globals = { "vim" }

-- Ignore line length warnings (stylua handles formatting)
max_line_length = false

-- Ignore unused self arguments (common in OOP-style Lua)
self = false
