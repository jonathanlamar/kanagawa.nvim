---@class Super16ColorSet
---@field bg ThemeColors default background
---@field bg_dim ThemeColors dimmed background
---@field bg_dark ThemeColors dark background (float)
---@field bg_light0 ThemeColors Fold/ColorColumn background
---@field bg_light1 ThemeColors CursorLine/TabLineSel background
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

---@param theme ThemeColors
local colorPalette = function(theme)
    ---@type Super16ColorSet
    return {
        bg = theme.black1,
        bg_dim = theme.black1b,
        bg_dark = theme.black0,
        bg_light0 = theme.black2,
        bg_light1 = theme.black3,
        bg_light2 = theme.black4,
        bg_light3 = theme.violet0,
        bg_menu = theme.blue1,
        bg_menu_sel = theme.blue2,
        bg_status = theme.black0,
        bg_visual = theme.blue1,
        bg_search = theme.blue2,
        fg_border = theme.black4,
        fg_dark = theme.white0,
        fg_reverse = theme.blue1,
        fg_comment = theme.gray1,
        fg = theme.white1,
        fg_menu = theme.white1,
        co = theme.orange2,
        st = theme.green2,
        nu = theme.magenta1,
        id = theme.yellow3,
        fn = theme.blue4,
        sm = theme.violet1,
        kw = theme.violet1,
        op = theme.yellow2,
        pp = theme.orange2,
        ty = theme.cyan1,
        sp = theme.blue6,
        sp2 = theme.magenta0,
        sp3 = theme.red4,
        br = theme.blue5,
        re = theme.yellow2,
        dep = theme.gray0,
        diag = {
            error = theme.red2,
            warning = theme.orange1,
            info = theme.blue3,
            hint = theme.cyan0,
        },
        diff = {
            add = theme.green0,
            delete = theme.red0,
            change = theme.blue0,
            text = theme.yellow0,
        },
        git = {
            added = theme.green1,
            removed = theme.red1,
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
    local theme = require("super16.themes")[config.theme]
    theme = vim.tbl_extend("force", theme, config.colors)
    local colors = colorPalette(theme)
    return vim.tbl_extend("force", theme, colors)
end

return M
