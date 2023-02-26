local M = {}

local function set_highlights(hlgroups)
    vim.cmd("highlight Normal guibg=" .. hlgroups.Normal.bg .. " guifg=" .. hlgroups.Normal.fg)
    hlgroups.Normal = nil
    for group, colors in pairs(hlgroups) do
        if not vim.tbl_isempty(colors) then
            vim.api.nvim_set_hl(0, group, colors)
        end
    end
end

--- default config
---@class Super16Config
M.config = {
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = false,
    terminalColors = true,
    ---@type ThemeColors|TermColors
    colors = {},
    overrides = {},
    theme = "kanagawa",
}

--- update global configuration with user settings
---@param config Super16Config? user configuration
function M.setup(config)
    M.config = vim.tbl_extend("force", M.config, config or {})
end

--- load the colorscheme
function M.load()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "super16"
    vim.o.termguicolors = true

    local colors = require("super16.colors").setup()
    local hlgroups = require("super16.hlgroups").setup(colors)

    set_highlights(hlgroups)
end

return M
