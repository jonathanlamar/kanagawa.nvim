local colors = require("super16.colors").setup()

local super16 = {}

super16.normal = {
  a = { bg = colors.crystalBlue, fg = colors.bg_dark },
  b = { bg = colors.winterBlue, fg = colors.crystalBlue },
  c = { bg = colors.bg_light0, fg = colors.fg },
}

super16.insert = {
  a = { bg = colors.autumnGreen, fg = colors.bg_dark },
  b = { bg = colors.bg, fg = colors.autumnGreen },
}

super16.command = {
  a = { bg = colors.boatYellow2, fg = colors.bg_dark },
  b = { bg = colors.bg, fg = colors.boatYellow2 },
}

super16.visual = {
  a = { bg = colors.oniViolet, fg = colors.bg_dark },
  b = { bg = colors.bg, fg = colors.oniViolet },
}

super16.replace = {
  a = { bg = colors.autumnRed, fg = colors.bg_dark },
  b = { bg = colors.bg, fg = colors.autumnRed },
}

super16.inactive = {
  a = { bg = colors.bg_status, fg = colors.crystalBlue },
  b = { bg = colors.bg_status, fg = colors.fujiGray, gui = "bold" },
  c = { bg = colors.bg_status, fg = colors.fujiGray },
}

if vim.g.kanagawa_lualine_bold then
  for _, mode in pairs(super16) do
    mode.a.gui = "bold"
  end
end

return super16
