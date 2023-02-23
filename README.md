# Super16

My own take on [Base16](https://github.com/chriskempson/base16). A framework for extrapolating rich highlight groups
from user-provided palettes. Powered by [HSLuv](https://www.hsluv.org) and the highlight groups defined in
[Kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim).

## Installation

Download with your favorite package manager.

```lua
use "jonathanlamar/super16.nvim"
```

## Requirements

- neovim >= 0.8
- truecolor terminal support
- undercurl terminal support (optional)

## Usage

Example with default configuration (using [lazy.nvim](https://github.com/folke/lazy.nvim)). There is no need to call
setup if you are ok with the defaults.

```lua
{
    "jonathanlamar/super16.nvim",
    lazy = true,
    config = function()
        local colors = require("super16.colors").setup()

        require("super16").setup({
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
            colors = {},
            overrides = {},
            theme = "kanagawa",
        })
        end,
}
```

## Plugin Support

- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [FloaTerm](https://github.com/voldikss/vim-floaterm)
- [dap-ui](https://github.com/rcarriga/nvim-dap-ui.git)
- [Notify](https://github.com/rcarriga/nvim-notify.git)

And many others should _"just work"_!

### Customize highlight groups and colors (UPDATE!)

You can change the colors of existing hl-groups as well as creating new ones. Supported keywords are the same for
`:h nvim_set_hl` `{val}` parameter.

**TODO:** Update this section once themes are in place.

You can define your own colors or use the provided themes (see example below). All the palette colors can be found
[here](lua/super16/colors.lua).

Example:

```lua
local default_colors = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
local my_colors = {
    -- use the palette color name...
    sumiInk1 = "black",
    fujiWhite = "#FFFFFF",
    -- ...or the theme name
    bg = "#272727",
    -- you can also define new colors if you want
    -- this will be accessible from require("kanagawa.colors").setup()
    -- AFTER calling require("kanagawa").setup(config)
    new_color = "teal"
}

local overrides = {
    -- create a new hl-group using default palette colors and/or new ones
    MyHlGroup1 = { fg = default_colors.waveRed, bg = "#AAAAAA", underline = true, bold = true, guisp="blue" },

    -- override existing hl-groups, the new keywords are merged with existing ones
    VertSplit  = { fg = default_colors.bg_dark, bg = "NONE" },
    TSError    = { link = "Error" },
    TSKeywordOperator = { bold = true},
    StatusLine = { fg = my_colors.new_color }
}

require'kanagawa'.setup({ overrides = overrides, colors = my_colors })
vim.cmd("colorscheme kanagawa")
```

Example for **Global Statusline**. Note: it works really nice with `dimInactive = true` option.

```lua
vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})
require'kanagawa'.setup({ globalStatus = true, ... })
vim.cmd("colorscheme kanagawa")
```

## Acknowledgements

All the hard work for HSLuv support and the excellent highlight groups comes from the wonderful
[Kanagawa](https://github.com/rebelot/kanagawa.nvim) colorscheme.  My original intention was to make a warmer and more
desaturated version of Kanagawa and merge it in as a theme, but the work to do so in a logical way ended up being this
repo, which is more general.  I ended up basically ripping off the idea of
[Base16](https://github.com/chriskempson/base16), but with highlight groups and features from Kanagawa (which I love),
and hopefully my own spin on logical palette extrapolation.
