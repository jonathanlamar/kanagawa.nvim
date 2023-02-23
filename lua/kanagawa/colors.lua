---@class KanagawaColors
local palette_colors = {

    -- Bg Shades
    sumiInk0      = "#282828",
    sumiInk1b     = "#181820",
    sumiInk1c     = "#1a1a22",
    sumiInk1      = "#1D2021",
    sumiInk2      = "#32302F",
    sumiInk3      = "#3C3836",
    sumiInk4      = "#504945",

    -- Popup and Floats
    waveBlue1     = "#665C54",
    waveBlue2     = "#374141",

    -- Diff and Git
    winterGreen   = "#34381b",
    winterYellow  = "#4f422e",
    winterRed     = "#402120",
    winterBlue    = "#0e363e",
    autumnGreen   = "#98971A",
    autumnRed     = "#9d0006",
    autumnYellow  = "#D79921",

    -- Diag
    samuraiRed    = "#CC241D",
    roninYellow   = "#FABD2F",
    waveAqua1     = "#689D6A",
    dragonBlue    = "#45707a",

    -- Fg and Comments
    oldWhite      = "#EBDBB2",
    fujiWhite     = "#FBF1C7",
    fujiGray      = "#928374",
    springViolet1 = "#B16286",

    oniViolet     = "#D3869B",
    crystalBlue   = "#458588",
    springViolet2 = "#7daea3",
    springBlue    = "#83A598",
    lightBlue     = "#80aa9e", -- unused yet
    waveAqua2     = "#8EC07C", -- improve lightness: desaturated greenish Aqua

    -- waveAqua2  = "#68AD99",
    -- waveAqua4  = "#7AA880",
    -- waveAqua5  = "#6CAF95",
    -- waveAqua3  = "#68AD99",

    springGreen   = "#B8BB26",
    boatYellow1   = "#A89984",
    boatYellow2   = "#BDAE93",
    carpYellow    = "#D5C4A1",

    sakuraPink    = "#d3869b",
    waveRed       = "#D65D0E",
    peachRed      = "#FB4934",
    surimiOrange  = "#FE8019",
    katanaGray    = "#7C6F64",
}

local M = {}

--- generate color table
---@param config table<string, string>? Config options containing colors and theme fields (optional)
---@return KanagawaColors # Palette colors and theme colors merged with config.colors
function M.setup(config)
    config = vim.tbl_extend("force", require("kanagawa").config, config or {})
    local colors = vim.tbl_extend("force", palette_colors, config.colors)
    local theme = require("kanagawa.themes")[config.theme](colors)
    theme = vim.tbl_extend("force", theme, config.colors)
    return vim.tbl_extend("force", theme, colors)
end

return M
