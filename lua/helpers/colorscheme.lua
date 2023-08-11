-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name, opts)
    local lua_ok, colorscheme = pcall(require, name)
    if lua_ok then
        colorscheme.setup(opts)
        return name
    end

    local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
    if vim_ok then
        return name
    end

    return "default"
end

-- Uncomment the colorscheme to use
local colorscheme = get_if_available("catppuccin-macchiato")
--local colorscheme = get_if_available("dracula")
--local colorscheme = get_if_available("onedark")
--local colorscheme = get_if_available("doom-one")

return colorscheme
