local colors = require("super16.colors").setup()

local super16 = {}

super16.normal = {
    a = { bg = colors.term04Blue, fg = colors.bg_dark },
    b = { bg = colors.blueBlack0, fg = colors.term04Blue },
    c = { bg = colors.bg_light0, fg = colors.fg },
}

super16.insert = {
    a = { bg = colors.term02Green, fg = colors.bg_dark },
    b = { bg = colors.bg, fg = colors.term02Green },
}

super16.command = {
    a = { bg = colors.term03Yellow, fg = colors.bg_dark },
    b = { bg = colors.bg, fg = colors.term03Yellow },
}

super16.visual = {
    a = { bg = colors.term05Violet, fg = colors.bg_dark },
    b = { bg = colors.bg, fg = colors.term05Violet },
}

super16.replace = {
    a = { bg = colors.term01Red, fg = colors.bg_dark },
    b = { bg = colors.bg, fg = colors.term01Red },
}

super16.inactive = {
    a = { bg = colors.bg_status, fg = colors.term04Blue },
    b = { bg = colors.bg_status, fg = colors.term08BrightBlack, gui = "bold" },
    c = { bg = colors.bg_status, fg = colors.term08BrightBlack },
}

return super16
