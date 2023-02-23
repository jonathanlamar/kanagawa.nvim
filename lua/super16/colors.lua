---@class Super16Colors
local palette_colors = {
    -- Bg Shades
    black0 = "#282828",
    black1b = "#181820",
    black1c = "#1a1a22",
    black1 = "#1D2021",
    black2 = "#32302F",
    black3 = "#3C3836",
    black4 = "#504945",

    -- Popup and Floats
    blue1 = "#665C54",
    blue2 = "#374141",

    -- Diff and Git
    green0 = "#34381b",
    yellow0 = "#4f422e",
    red0 = "#402120",
    blue0 = "#0e363e",
    green1 = "#98971A",
    red1 = "#9d0006",
    orange0 = "#D79921",

    -- Diag
    red2 = "#CC241D",
    orange1 = "#FABD2F",
    cyan0 = "#689D6A",
    blue3 = "#45707a",

    -- Fg and Comments
    white0 = "#EBDBB2",
    white1 = "#FBF1C7",
    gray1 = "#928374",
    violet0 = "#B16286",
    violet1 = "#D3869B",
    blue4 = "#458588",
    blue5 = "#7daea3",
    blue6 = "#83A598",
    blue7 = "#80aa9e", -- unused yet
    cyan1 = "#8EC07C", -- improve lightness: desaturated greenish Aqua

    green2 = "#B8BB26",
    yellow1 = "#A89984",
    yellow2 = "#BDAE93",
    yellow3 = "#D5C4A1",
    magenta1 = "#d3869b",
    magenta0 = "#D65D0E",
    red4 = "#FB4934",
    orange2 = "#FE8019",
    gray0 = "#7C6F64",
}

local M = {}

--- generate color table
---@param config table<string, string>? Config options containing colors and theme fields (optional)
---@return Super16Colors # Palette colors and theme colors merged with config.colors
function M.setup(config)
    config = vim.tbl_extend("force", require("super16").config, config or {})
    local colors = vim.tbl_extend("force", palette_colors, config.colors)
    local theme = require("super16.themes")[config.theme](colors)
    theme = vim.tbl_extend("force", theme, config.colors)
    return vim.tbl_extend("force", theme, colors)
end

return M
