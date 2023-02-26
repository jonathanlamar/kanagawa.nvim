---@class ThemeColors
---@field term00Black string
---@field black1b string
---@field black1c string
---@field black1 string
---@field black2 string
---@field black3 string
---@field black4 string
---@field blueBlack1 string
---@field blueBlack2 string
---@field greenBlack string
---@field yellowBlack string
---@field redBlack string
---@field blueBlack0 string
---@field term02Green string
---@field term01Red string
---@field orange0 string
---@field term09BrightRed string
---@field orange1 string
---@field term06Cyan string
---@field darkBlue string
---@field term07White string
---@field term15BrightWhite string
---@field term08BrightBlack string
---@field term05Violet string
---@field term13BrightViolet string
---@field term04Blue string
---@field lightBlue string
---@field term12BrightBlue string
---@field lightBrightBlue string
---@field term14BrightCyan string
---@field term10BrightGreen string
---@field darkYellow string
---@field term03Yellow string
---@field term11BrightYellow string
---@field brightMagenta string
---@field magenta string
---@field pinkRed string
---@field orange2 string
---@field gray string

---@class Super16ColorSet
---@field bg ThemeColors default background
---@field bg_dim ThemeColors dimmed background
---@field bg_dark ThemeColors dark background (float)
---@field bg_light0 ThemeColors Fold/ColorColumn background
---@field bg_light1 ThemeColors TabLineSel background
---@field bg_light2 ThemeColors NonText foreground
---@field bg_light3 ThemeColors dimmed foreground (Conceal, Folded, TabLine)
---@field bg_menu ThemeColors
---@field bg_menu_sel ThemeColors
---@field bg_status ThemeColors
---@field bg_visual ThemeColors
---@field bg_search ThemeColors
---@field fg_border ThemeColors
---@field fg_dark ThemeColors
---@field fg_reverse ThemeColors
---@field fg_comment ThemeColors
---@field fg ThemeColors
---@field fg_menu ThemeColors
---@field co ThemeColors
---@field st ThemeColors
---@field nu ThemeColors
---@field id ThemeColors
---@field fn ThemeColors
---@field sm ThemeColors
---@field kw ThemeColors
---@field op ThemeColors
---@field pp ThemeColors
---@field ty ThemeColors
---@field sp ThemeColors
---@field sp2 ThemeColors
---@field sp3 ThemeColors
---@field br ThemeColors
---@field re ThemeColors
---@field dep ThemeColors
---@field diag { error: ThemeColors, warning: ThemeColors, info: ThemeColors, hint: ThemeColors }
---@field diff { add: ThemeColors, delete: ThemeColors, change: ThemeColors, text: ThemeColors }
---@field git { added: ThemeColors, removed: ThemeColors, changed: ThemeColors }

---@param theme TermColors|ThemeColors
---@return TermColors
local limitToTermColors = function(theme)
    return {
        term00Black = theme.term00Black,
        term01Red = theme.term01Red,
        term02Green = theme.term02Green,
        term03Yellow = theme.term03Yellow,
        term04Blue = theme.term04Blue,
        term05Violet = theme.term05Violet,
        term06Cyan = theme.term06Cyan,
        term07White = theme.term07White,
        term08BrightBlack = theme.term08BrightBlack,
        term09BrightRed = theme.term09BrightRed,
        term10BrightGreen = theme.term10BrightGreen,
        term11BrightYellow = theme.term11BrightYellow,
        term12BrightBlue = theme.term12BrightBlue,
        term13BrightViolet = theme.term13BrightViolet,
        term14BrightCyan = theme.term14BrightCyan,
        term15BrightWhite = theme.term15BrightWhite,
    }
end

local c = require("super16.color")
---@param termColors TermColors
---@return ThemeColors
local buildThemeFromTermColors = function(termColors)
    local derivedColors = {
        black1 = tostring(c(termColors.term00Black):lighten(1.6)),
        black1b = tostring(c(termColors.term00Black):lighten(1.15)),
        black1c = tostring(c(termColors.term00Black):lighten(1.3)),
        black2 = tostring(c(termColors.term00Black):lighten(2.3)),
        black3 = tostring(c(termColors.term00Black):lighten(3.1)),
        black4 = tostring(c(termColors.term00Black):lighten(4.8)),
        blueBlack0 = tostring(c(termColors.term04Blue):lighten(0.25):saturate(0.4):hue(10)),
        blueBlack1 = tostring(c(termColors.term04Blue):lighten(0.3):saturate(0.9)),
        blueBlack2 = tostring(c(termColors.term04Blue):lighten(0.5):hue(-15)),
        brightMagenta = tostring(c(termColors.term09BrightRed):hue(-20):saturate(0.55):lighten(1.2)),
        darkBlue = tostring(c(termColors.term04Blue):lighten(0.85):saturate(0.7):hue(-25)),
        darkYellow = tostring(c(termColors.term03Yellow):saturate(0.95):lighten(0.8)),
        gray = tostring(c(termColors.term08BrightBlack):hue(115):lighten(1.07)),
        greenBlack = tostring(c(termColors.term02Green):lighten(0.35):saturate(0.6)),
        lightBlue = tostring(c(termColors.term04Blue):lighten(1.1):saturate(0.6)),
        lightBrightBlue = tostring(c(termColors.term12BrightBlue):lighten(1.15):saturate(0.75):hue(-30)),
        magenta = tostring(c(termColors.term01Red):hue(-4):saturate(1.1):lighten(1.3)),
        orange0 = tostring(c(termColors.term01Red):hue(40):lighten(1.55)),
        orange1 = tostring(c(termColors.term01Red):hue(30):lighten(1.55):saturate(1.5)),
        orange2 = tostring(c(termColors.term01Red):hue(20):lighten(1.6):saturate(1.5)),
        pinkRed = tostring(c(termColors.term01Red):saturate(1.5):lighten(1.3)),
        redBlack = tostring(c(termColors.term01Red):lighten(0.4):saturate(0.45)),
        yellowBlack = tostring(c(termColors.term03Yellow):lighten(0.4):saturate(0.35)),
    }
    return vim.tbl_extend("force", derivedColors, termColors)
end

---@param theme ThemeColors
local colorPalette = function(theme)
    ---@type Super16ColorSet
    return {
        bg = theme.black1,
        bg_dim = theme.black1b,
        bg_dark = theme.term00Black,
        bg_light0 = theme.black2,
        bg_light1 = theme.black3,
        bg_light2 = theme.black4,
        bg_light3 = theme.term05Violet,
        bg_menu = theme.blueBlack1,
        bg_menu_sel = theme.blueBlack2,
        bg_status = theme.term00Black,
        bg_visual = theme.blueBlack1,
        bg_search = theme.blueBlack2,
        fg_border = theme.black4,
        fg_dark = theme.term07White,
        fg_reverse = theme.blueBlack1,
        fg_comment = theme.term08BrightBlack,
        fg = theme.term15BrightWhite,
        fg_menu = theme.term15BrightWhite,
        co = theme.orange2,
        st = theme.term10BrightGreen,
        nu = theme.brightMagenta,
        id = theme.term11BrightYellow,
        fn = theme.term04Blue,
        sm = theme.term13BrightViolet,
        kw = theme.term13BrightViolet,
        op = theme.term03Yellow,
        pp = theme.orange2,
        ty = theme.term14BrightCyan,
        sp = theme.term12BrightBlue,
        sp2 = theme.magenta,
        sp3 = theme.pinkRed,
        br = theme.lightBlue,
        re = theme.term03Yellow,
        dep = theme.term08BrightBlack,
        diag = {
            error = theme.term09BrightRed,
            warning = theme.orange1,
            info = theme.darkBlue,
            hint = theme.term06Cyan,
        },
        diff = {
            add = theme.greenBlack,
            delete = theme.redBlack,
            change = theme.blueBlack0,
            text = theme.yellowBlack,
        },
        git = {
            added = theme.term02Green,
            removed = theme.term01Red,
            changed = theme.orange0,
        },
    }
end

local M = {}
--- generate color table
---@param config table<string, string>? Config options containing colors and theme fields (optional)
---@return Super16ColorSet|ThemeColors # Palette colors and theme colors merged with config.colors
function M.setup(config)
    config = vim.tbl_extend("force", require("super16").config, config or {})
    local termColors = limitToTermColors(require("super16.themes")[config.theme])
    local theme = buildThemeFromTermColors(termColors)
    theme = vim.tbl_extend("force", theme, config.colors)
    return vim.tbl_extend("force", theme, colorPalette(theme))
end

return M
