local c = require("super16.color")
--TODO: standardize theme color names

---@class ThemeColors
---@field bg Super16Colors default background
---@field bg_dim Super16Colors dimmed background
---@field bg_dark Super16Colors dark background (float)
---@field bg_light0 Super16Colors Fold/ColorColumn background
---@field bg_light1 Super16Colors CursorLine/TabLineSel background
---@field bg_light2 Super16Colors NonText foreground
---@field bg_light3 Super16Colors dimmed foreground (Conceal, Folded, TabLine)
---@field bg_menu Super16Colors
---@field bg_menu_sel Super16Colors
---@field bg_status Super16Colors
---@field bg_visual Super16Colors
---@field bg_search Super16Colors
---@field fg_border Super16Colors
---@field fg_dark Super16Colors
---@field fg_reverse Super16Colors
---@field fg_comment Super16Colors
---@field fg Super16Colors
---@field fg_menu Super16Colors
---@field co Super16Colors
---@field st Super16Colors
---@field nu Super16Colors
---@field id Super16Colors
---@field fn Super16Colors
---@field sm Super16Colors
---@field kw Super16Colors
---@field op Super16Colors
---@field pp Super16Colors
---@field ty Super16Colors
---@field sp Super16Colors
---@field sp2 Super16Colors
---@field sp3 Super16Colors
---@field br Super16Colors
---@field re Super16Colors
---@field dep Super16Colors
---@field diag { error: Super16Colors, warning: Super16Colors, info: Super16Colors, hint: Super16Colors }
---@field diff { add: Super16Colors, delete: Super16Colors, change: Super16Colors, text: Super16Colors }
---@field git { added: Super16Colors, removed: Super16Colors, changed: Super16Colors }

return {
    ---@param colors Super16Colors
    default = function(colors)
        ---@type ThemeColors
        return {
            bg = colors.black1,
            bg_dim = colors.black1b,
            bg_dark = colors.black0,
            bg_light0 = colors.black2,
            bg_light1 = colors.black3,
            bg_light2 = colors.black4,
            bg_light3 = colors.violet0,
            bg_menu = colors.blue1,
            bg_menu_sel = colors.blue2,
            bg_status = colors.black0,
            bg_visual = colors.blue1,
            bg_search = colors.blue2,
            fg_border = colors.black4,
            fg_dark = colors.white0,
            fg_reverse = colors.blue1,
            fg_comment = colors.gray1,
            fg = colors.white1,
            fg_menu = colors.white1,
            co = colors.orange2,
            st = colors.green2,
            nu = colors.magenta1,
            id = colors.yellow3,
            fn = colors.blue4,
            sm = colors.violet1,
            kw = colors.violet1,
            op = colors.yellow2,
            pp = colors.orange2,
            ty = colors.cyan1,
            sp = colors.blue6,
            sp2 = colors.magenta0,
            sp3 = colors.red4,
            br = colors.blue5,
            re = colors.yellow2,
            dep = colors.gray0,
            diag = {
                error = colors.red2,
                warning = colors.orange1,
                info = colors.blue3,
                hint = colors.cyan0,
            },
            diff = {
                add = colors.green0,
                delete = colors.red0,
                change = colors.blue0,
                text = colors.yellow0,
            },
            git = {
                added = colors.green1,
                removed = colors.red1,
                changed = colors.orange0,
            },
        }
    end,
    dragon = function(colors)
        ---@type ThemeColors
        return {
            bg = "#181616",
            bg_dim = "#1D1C19",
            bg_dark = "#121111",
            bg_light0 = "#282727",
            bg_light1 = "#393836",
            bg_light2 = "#524F4B",
            bg_light3 = "#6E7675",
            bg_menu = colors.waveBlue1,
            bg_menu_sel = colors.waveBlue2,
            bg_status = "#111115",
            bg_visual = colors.waveBlue1,
            bg_search = colors.waveBlue2,
            fg_border = colors.sumiInk4,
            fg_dark = colors.oldWhite,
            fg_reverse = colors.waveBlue1,
            fg_comment = "#737c73",
            fg = "#c5c9c5",
            fg_menu = colors.fujiWhite,
            co = "#b6927b",
            st = "#87a987",
            nu = "#a292a3",
            id = "#a6a69c", --ok
            fn = "#8ba4b0",
            sm = "#8992a7",
            kw = "#8992a7",
            op = "#c4746e",
            pp = "#a99c8b",
            -- ty = "#5B7B79",
            ty = "#8ea4a2",
            sp = "#949fb5",
            sp2 = "#aa9e89",
            sp3 = "#aa9e89",
            br = "#9e9b93",
            re = "#c3746e",
            dep = colors.katanaGray,
            diag = {
                error = colors.samuraiRed,
                warning = colors.roninYellow,
                info = colors.dragonBlue,
                hint = colors.waveAqua1,
            },
            diff = {
                add = colors.winterGreen,
                delete = colors.winterRed,
                change = colors.winterBlue,
                text = colors.winterYellow,
            },
            git = {
                added = colors.autumnGreen,
                removed = colors.autumnRed,
                changed = colors.autumnYellow,
            },
        }
    end,
    ---@param colors Super16Colors
    light = function(colors)
        ---@type ThemeColors
        return {
            bg = tostring(c(colors.white1):lighten(1.1):saturate(1.8)),
            bg_dim = tostring(c(colors.white1):lighten(1.1):saturate(1.5):lighten(0.97)),
            bg_dark = tostring(c(colors.white1):lighten(0.96):saturate(1.5)),
            bg_light0 = tostring(c(colors.white0):lighten(1.12):saturate(0.99)),
            bg_light1 = tostring(c(colors.white0):lighten(1.15)),
            bg_light2 = tostring(c(colors.violet0):lighten(1.1):saturate(0.6)),
            bg_light3 = tostring(c(colors.violet0):lighten(0.8)),
            -- bg_menu = tostring(c(colors.waveBlue1):lighten(4):saturate(0.30):hue(1)),
            -- bg_menu = tostring(c(colors.waveBlue1):lighten(3.9):saturate(0.5):hue(1)),
            bg_menu = tostring(c(colors.blue2):lighten(2.65):saturate(0.4):hue(0.95)),
            bg_menu_sel = tostring(c(colors.blue1):lighten(3.55):saturate(0.5):hue(0.95)),
            bg_status = tostring(c(colors.white0):lighten(1.06):saturate(1)),
            -- bg_status = tostring(c(colors.fujiWhite):lighten(1):saturate(1)),
            bg_visual = tostring(c(colors.blue1):lighten(4):saturate(0.20)),
            bg_search = tostring(c(colors.blue2):lighten(2.5):hue(0.9):saturate(0.3)),
            fg_border = tostring(c(colors.white0):lighten(0.6):saturate(0.5)),
            fg_dark = tostring(c(colors.black1):lighten(2.5):saturate(2.5)),
            fg_reverse = colors.white1,
            fg_comment = tostring(c(colors.gray1):lighten(1.2)),
            fg = tostring(c(colors.black1):lighten(3.0):saturate(0.9)),
            fg_menu = tostring(c(colors.black4):lighten(0.90)),
            co = tostring(c(colors.orange2):lighten(0.75)),
            st = tostring(c(colors.green2):lighten(0.75)),
            nu = tostring(c(colors.magenta1):lighten(0.8):saturate(0.9)),
            id = tostring(c(colors.yellow3):lighten(0.65):saturate(1.2)),
            fn = tostring(c(colors.blue4):lighten(0.73):saturate(1)),
            sm = tostring(c(colors.violet1):lighten(0.8):saturate(1)),
            kw = tostring(c(colors.violet1):lighten(0.8):saturate(1)),
            op = tostring(c(colors.yellow2):lighten(0.7):saturate(1)),
            pp = tostring(c(colors.orange2):lighten(0.75)),
            ty = tostring(c(colors.cyan1):lighten(0.8):saturate(1)),
            sp = tostring(c(colors.blue6):lighten(0.78):saturate(1.34)),
            sp2 = tostring(c(colors.magenta0):lighten(0.80):saturate(1.0)),
            sp3 = tostring(c(colors.red4):lighten(0.8):saturate(1):hue(1)),
            br = tostring(c(colors.blue5):lighten(0.7):saturate(0.9)),
            re = tostring(c(colors.yellow2):lighten(0.7):saturate(1)),
            dep = tostring(c(colors.gray0):lighten(0.5)),
            diag = {
                error = tostring(c(colors.red2):lighten(1)),
                warning = tostring(c(colors.orange1):lighten(0.9):saturate(1)),
                info = tostring(c(colors.blue3):lighten(0.9)),
                hint = tostring(c(colors.cyan0):lighten(0.9)),
            },
            diff = {
                add = tostring(c(colors.green0):lighten(4):saturate(0.9)),
                delete = tostring(c(colors.red0):lighten(3.9):saturate(1.3):hue(0.08)),
                change = tostring(c(colors.blue0):lighten(5.8):saturate(0.5):hue(0.5)),
                text = tostring(c(colors.yellow0):lighten(3):saturate(4)),
            },
            git = {
                added = tostring(c(colors.green1):lighten(0.97):saturate(1.2)),
                removed = tostring(c(colors.red1):lighten(1.1):saturate(1)),
                changed = tostring(c(colors.orange0):lighten(0.95):saturate(1.5)),
            },
        }
    end,
}
