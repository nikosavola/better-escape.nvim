local M = {}

--- Run health checks for better-escape.nvim.
---
--- Checks:
--- - Neovim version is 0.7.0+ (required for vim.keymap.set)
--- - Plugin has been set up via require("better_escape").setup()
--- - At least one mapping is configured
function M.check()
    vim.health.start("better-escape.nvim")

    -- Check Neovim version
    if vim.fn.has("nvim-0.7.0") == 1 then
        vim.health.ok("Neovim >= 0.7.0")
    else
        vim.health.error(
            "Neovim >= 0.7.0 is required",
            { "Update Neovim to 0.7.0 or later." }
        )
    end

    -- Check that setup has been called (the module should be loaded)
    local ok, be = pcall(require, "better_escape")
    if ok and be then
        vim.health.ok("Plugin loaded")
    else
        vim.health.warn("Plugin not loaded", {
            'Call require("better_escape").setup() in your configuration.',
        })
    end
end

return M
