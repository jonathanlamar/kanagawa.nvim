local M = {}

---@param colors Super16ColorSet|ThemeColors
local function setup_terminal_colors(colors)
    vim.g.terminal_color_0 = colors.term00Black -- black
    vim.g.terminal_color_1 = colors.term01Red -- red
    vim.g.terminal_color_2 = colors.term02Green -- green
    vim.g.terminal_color_3 = colors.term03Yellow -- yellow
    vim.g.terminal_color_4 = colors.term04Blue -- blue
    vim.g.terminal_color_5 = colors.term05Violet -- violet
    vim.g.terminal_color_6 = colors.term06Cyan -- cyan
    vim.g.terminal_color_7 = colors.term07White -- white
    vim.g.terminal_color_8 = colors.term08BrightBlack -- bright black
    vim.g.terminal_color_9 = colors.term09BrightRed -- bright red
    vim.g.terminal_color_10 = colors.term10BrightGreen -- bright green
    vim.g.terminal_color_11 = colors.term11BrightYellow -- bright yellow
    vim.g.terminal_color_12 = colors.term12BrightBlue -- bright blue
    vim.g.terminal_color_13 = colors.term13BrightViolet -- bright violet
    vim.g.terminal_color_14 = colors.term14BrightCyan -- bright cyan
    vim.g.terminal_color_15 = colors.term15BrightWhite -- bright white
    vim.g.terminal_color_16 = colors.orange2 -- extended color 1
    vim.g.terminal_color_17 = colors.pinkRed -- extended color 2
end

--- generate highlights table
---@param colors Super16ColorSet|ThemeColors theme color table created by require("super16.colors").setup()
---@param config table? config options (optional)
function M.setup(colors, config)
    config = vim.tbl_extend("force", require("super16").config, config or {})

    local hlgroups = {
        Comment = vim.tbl_extend("force", { fg = colors.fg_comment }, config.commentStyle),
        ColorColumn = { bg = colors.bg_light0 },
        Conceal = { fg = colors.bg_light3, bold = true },
        Cursor = { fg = colors.bg, bg = colors.fg },
        lCursor = { link = "Cursor" },
        CursorIM = { link = "Cursor" },
        CursorLine = { bg = colors.bg_light0 },
        CursorColumn = { link = "CursorLine" },
        Directory = { fg = colors.fn },
        DiffAdd = { bg = colors.diff.add },
        DiffChange = { bg = colors.diff.change },
        DiffDelete = { fg = colors.git.removed, bg = colors.diff.delete },
        DiffText = { bg = colors.diff.text },
        EndOfBuffer = { fg = colors.bg },
        -- TermCursor = {},
        -- TermCursorNC = {},
        ErrorMsg = { fg = colors.diag.error },
        WinSeparator = {
            fg = colors.term07White,
            bg = config.dimInactive and colors.bg_dim or "NONE",
        },
        VertSplit = { link = "WinSeparator" },
        Folded = { fg = colors.bg_light3, bg = colors.bg_light0 },
        FoldColumn = { fg = colors.bg_light2 },
        SignColumn = { fg = colors.bg_light2 },
        SignColumnSB = { link = "SignColumn" },
        Substitute = { fg = colors.fg, bg = colors.git.removed },
        LineNr = { fg = colors.bg_light2 },
        CursorLineNr = { fg = colors.diag.warning, bold = true },
        MatchParen = { fg = colors.diag.warning, bold = true },
        ModeMsg = { fg = colors.diag.warning, bold = true },
        MsgArea = { fg = colors.fg_dark },
        -- MsgSeparator = {},
        MoreMsg = { fg = colors.diag.info, bg = colors.bg },
        NonText = { fg = colors.bg_light2 },
        Normal = { fg = colors.fg, bg = not config.transparent and colors.bg or "NONE" },
        NormalNC = config.dimInactive and { fg = colors.fg_dark, bg = colors.bg_dim } or { link = "Normal" },
        NormalSB = { link = "Normal" },
        NormalFloat = { fg = colors.fg_dark, bg = colors.bg_dark },
        FloatBorder = { fg = colors.fg_border, bg = colors.bg_dark },
        FloatTitle = { fg = colors.bg_light3, bg = colors.bg_dark, bold = true },
        Pmenu = { fg = colors.fg_menu, bg = colors.bg_menu },
        PmenuSel = { fg = "NONE", bg = colors.bg_menu_sel },
        PmenuSbar = { link = "Pmenu" },
        PmenuThumb = { bg = colors.bg_search },
        Question = { link = "MoreMsg" },
        QuickFixLine = { link = "CursorLine" },
        Search = { fg = colors.fg, bg = colors.bg_search },
        CurSearch = {
            link = "Search", --[[ IncSearch ]]
        },
        IncSearch = { fg = colors.bg_visual, bg = colors.diag.warning },
        SpecialKey = { link = "NonText" },
        SpellBad = { undercurl = true, sp = colors.diag.error },
        SpellCap = { undercurl = true, sp = colors.diag.warning },
        SpellLocal = { undercurl = true, sp = colors.diag.warning },
        SpellRare = { undercurl = true, sp = colors.diag.warning },
        StatusLine = { fg = colors.fg_dark, bg = colors.bg_status },
        StatusLineNC = { fg = colors.fg_comment, bg = colors.bg_status },
        Winbar = { fg = colors.fg_dark, bg = "NONE" },
        WinbarNC = { fg = colors.fg_dark, bg = config.dimInactive and colors.bg_dim or "NONE" },
        TabLine = { bg = colors.bg_dark, fg = colors.bg_light3 },
        TabLineFill = { bg = colors.bg },
        TabLineSel = { fg = colors.fg_dark, bg = colors.bg_light1 },
        Title = { fg = colors.fn, bold = true },
        Visual = { bg = colors.bg_visual },
        VisualNOS = { link = "Visual" },
        WarningMsg = { fg = colors.diag.warning },
        Whitespace = { fg = colors.bg_light2 },
        WildMenu = { link = "Pmenu" },
        Constant = { fg = colors.co },
        String = { fg = colors.st },
        Character = { link = "String" },
        Number = { fg = colors.nu },
        Boolean = { fg = colors.co, bold = true },
        Float = { link = "Number" },
        Identifier = { fg = colors.id },
        Function = vim.tbl_extend("force", { fg = colors.fn }, config.functionStyle),
        Method = { link = "Function" },
        Statement = vim.tbl_extend("force", { fg = colors.sm }, config.statementStyle),
        -- Conditional = {},
        -- Repeat = {},
        -- Label = {},
        Operator = { fg = colors.op },
        Keyword = vim.tbl_extend("force", { fg = colors.kw }, config.keywordStyle),
        Exception = { fg = colors.sp2 },
        PreProc = { fg = colors.pp },
        -- Include = {},
        -- Define = {},
        -- Macro = {},
        -- PreCondit = {},

        Type = vim.tbl_extend("force", { fg = colors.ty }, config.typeStyle),
        Struct = { link = "Type" },
        -- StorageClass = {},
        -- Structure = {},
        -- Typedef = {},

        Special = { fg = colors.sp },
        -- SpecialChar = {},
        -- Tag = {},
        -- Delimiter = { fg = c.br},
        -- SpecialComment = {},
        -- Debug = {},

        Underlined = { fg = colors.sp, underline = true },
        Bold = { bold = true },
        Italic = { italic = true },
        Ignore = { link = "NonText" },
        Error = { fg = colors.diag.error },
        Todo = { fg = colors.fg_reverse, bg = colors.diag.info, bold = true },
        qfLineNr = { link = "lineNr" },
        qfFileName = { link = "Directory" },
        -- htmlH1 = {},
        -- htmlH2 = {},

        -- mkdHeading = {},
        -- mkdCode = {},
        -- mkdCodeDelimiter = {},
        -- mkdCodeStart = {},
        -- mkdCodeEnd = {},
        -- mkdLink = {},

        -- markdownHeadingDelimiter = {},
        markdownCode = { fg = colors.st },
        markdownCodeBlock = { fg = colors.st },
        markdownEscape = { fg = "NONE" },
        -- markdownH1 = {},
        -- markdownH2 = {},
        -- markdownLinkText = {},

        debugPC = { bg = colors.diff.delete },
        debugBreakpoint = { fg = colors.sp },
        LspReferenceText = { bg = colors.diff.text },
        LspReferenceRead = { link = "LspReferenceText" },
        LspReferenceWrite = { link = "LspReferenceText" },
        DiagnosticError = { fg = colors.diag.error },
        DiagnosticWarn = { fg = colors.diag.warning },
        DiagnosticInfo = { fg = colors.diag.info },
        DiagnosticHint = { fg = colors.diag.hint },
        DiagnosticSignError = { link = "DiagnosticError" },
        DiagnosticSignWarn = { link = "DiagnosticWarn" },
        DiagnosticSignInfo = { link = "DiagnosticInfo" },
        DiagnosticSignHint = { link = "DiagnosticHint" },
        DiagnosticVirtualTextError = { link = "DiagnosticError" },
        DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
        DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
        DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.diag.error },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.diag.warning },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.diag.info },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.diag.hint },
        LspSignatureActiveParameter = { fg = colors.diag.warning },
        LspCodeLens = { fg = colors.fg_comment },
        -- TSAnnotation = {},
        ["@attribute"] = { link = "Constant" },
        -- TSBoolean = {},
        -- TSCharacter = {},
        -- TSComment = {},
        -- TSNote = { fg = c.fg_dark, bg = c.diag.hint, nocombine = true, bold = true}, -- links to SpecialComment -> Special
        ["@text.warning"] = { link = "Todo" }, --default
        ["@text.strong"] = { bold = true },
        ["@text.emphasis"] = { italic = true },
        ["@text.title"] = { link = "Function" },
        ["@text.danger"] = { link = "WarningMsg" }, --default
        ["@text.literal"] = { link = "String" },
        ["@constructor"] = { fg = colors.kw }, -- Function/Special/Statement/Keyword
        -- TSConditional = {},
        -- TSConstant = {},
        -- TSConstBuiltin = {},
        -- TSConstMacro = {},
        -- TSError = { fg = colors.diag.error },
        -- TSException = { link = 'Exception' }, -- default, -> statement
        ["@exception"] = vim.tbl_extend(
            "force",
            { fg = config.specialException and colors.sp3 or colors.sm },
            config.statementStyle
        ),
        ["@field"] = { link = "Identifier" }, -- default
        -- TSField = { link = 'Variable'},
        -- TSFloat = {},
        -- TSFunction = {},
        -- TSFuncBuiltin = {link = "Function" },
        -- TSFuncMacro = {},
        -- TSInclude = {},
        ["@keyword"] = { link = "Keyword" },
        -- TSKeywordFunction = { link = "Keyword" }, -- default
        -- TSKeywordFunction = { link = "Function" },
        ["@keyword.return"] = vim.tbl_extend(
            "force",
            { fg = config.specialReturn and colors.sp3 or colors.kw },
            config.keywordStyle
        ),
        ["@label"] = { link = "Label" },
        ["@method"] = { link = "Function" },
        -- TSNamespace = {},
        -- TSNone = {},
        -- TSNumber = {},
        ["@operator"] = { link = "Operator" },
        ["@keyword.operator"] = { fg = colors.op, bold = true },
        ["@namespace"] = { link = "Identifier" }, -- default
        -- TSParameterReference = {},
        ["@property"] = { link = "Identifier" }, -- default
        -- TSPunctDelimiter = { fg = c.op },
        ["@punctuation.delimiter"] = { fg = colors.br },
        ["@punctuation.bracket"] = { fg = colors.br },
        ["@punctuation.Special"] = { fg = colors.br },
        -- TSRepeat = {},
        -- TSString = {},
        ["@string.regex"] = { fg = colors.re },
        ["@string.escape"] = { fg = colors.re, bold = true },
        ["@symbol"] = { fg = colors.id },
        -- TSType = {},
        -- TSTypeBuiltin = {},
        ["@variable"] = { fg = colors.fg },
        ["@variable.builtin"] = vim.tbl_extend("force", { fg = colors.sp2 }, config.variablebuiltinStyle),
        -- TSTag = {},
        -- TSTagDelimiter = {},
        ["@tag"] = { link = "Tag" },
        ["@tag.delimiter"] = { fg = colors.br },
        ["@tag.attribute"] = { fg = colors.id },
        -- TSText = {},
        -- TSTextReference = { fg = c.sp2 },
        -- TSEmphasis = {},
        -- TSUnderline = {},
        -- TSStrike = {},
        -- TSTitle = {},
        -- TSLiteral = {},
        -- TSURI = {},

        -- Lua
        -- luaTSProperty = {},

        -- LspTrouble
        -- LspTroubleText = {},
        -- LspTroubleCount = {},
        -- LspTroubleNormal = {},

        -- Illuminate
        -- illuminatedWord = {},
        -- illuminatedCurWord = {},

        -- Git
        diffAdded = { fg = colors.git.added },
        diffRemoved = { fg = colors.git.removed },
        diffDeleted = { fg = colors.git.removed },
        diffChanged = { fg = colors.git.changed },
        diffOldFile = { fg = colors.git.removed },
        diffNewFile = { fg = colors.git.added },
        -- diffFile = { fg = c.steelGray },
        -- diffLine = { fg = c.steelGray },
        -- diffIndexLine = { link = 'Identifier' },

        -- Neogit
        -- NeogitBranch = {},
        -- NeogitRemote = {},
        NeogitDiffDelete = { fg = colors.git.removed, bg = colors.diff.delete },
        NeogitDiffAdd = { fg = colors.git.added, bg = colors.diff.add },
        NeogitHunkHeader = { fg = colors.id },
        NeogitDiffContextHighlight = { bg = colors.diff.change },
        -- GitGutter
        -- GitGutterAdd = {},
        -- GitGutterChange = {},
        -- GitGutterDelete = {},

        -- GitSigns
        GitSignsAdd = { link = "diffAdded" },
        GitSignsChange = { link = "diffChanged" },
        GitSignsDelete = { link = "diffDeleted" },
        GitSignsDeleteLn = { bg = colors.diff.delete },
        -- Telescope                      = {},
        TelescopeBorder = { fg = colors.fg_border, bg = colors.bg },
        TelescopeResultsClass = { link = "TSType" },
        TelescopeResultsStruct = { link = "TSType" },
        TelescopeResultsVariable = { link = "TSVariable" },
        -- NvimTree                       = {},
        NvimTreeNormal = { link = "Normal" },
        NvimTreeNormalNC = { link = "NormalNC" },
        NvimTreeRootFolder = { fg = colors.id, bold = true },
        NvimTreeGitDirty = { fg = colors.git.changed },
        NvimTreeGitNew = { fg = colors.git.added },
        NvimTreeGitDeleted = { fg = colors.git.removed },
        NvimTreeSpecialFile = { fg = colors.sp },
        -- NvimTreeIndentMarker           = {},
        NvimTreeImageFile = { fg = colors.sp2 },
        NvimTreeSymlink = { link = "Type" },
        NvimTreeFolderName = { link = "Directory" },
        NvimTreeExecFile = { fg = colors.st, bold = true },
        NvimTreeGitStaged = { fg = colors.git.added },
        NvimTreeOpenedFile = { fg = colors.sp, italic = true },
        NvimTreeWinSeparator = { link = "WinSeparator" },
        -- NeoTree
        NeoTreeDirectoryIcon = { link = "NvimTreeFolderIcon" },
        NeoTreeDirectoryName = { link = "NvimTreeFolderName" },
        NeoTreeSymbolicLinkTarget = { link = "NvimTreeSymlink" },
        NeoTreeRootName = { link = "NvimTreeRootFolder" },
        NeoTreeFileNameOpened = { link = "NvimTreeOpenedFile" },
        -- Dashboard
        DashboardShortCut = { fg = colors.sp },
        DashboardHeader = { fg = colors.git.removed },
        DashboardCenter = { fg = colors.id },
        DashboardFooter = { fg = colors.fn },
        -- Notify
        NotifyERRORBorder = { link = "DiagnosticError" },
        NotifyWARNBorder = { link = "DiagnosticWarn" },
        NotifyINFOBorder = { link = "DiagnosticInfo" },
        NotifyHINTBorder = { link = "DiagnosticHint" },
        NotifyDEBUGBorder = { link = "Debug" },
        NotifyTRACEBorder = { link = "Comment" },
        NotifyERRORIcon = { link = "DiagnosticError" },
        NotifyWARNIcon = { link = "DiagnosticWarn" },
        NotifyINFOIcon = { link = "DiagnosticInfo" },
        NotifyHINTIcon = { link = "DiagnosticHint" },
        NotifyDEBUGIcon = { link = "Debug" },
        NotifyTRACEIcon = { link = "Comment" },
        NotifyERRORTitle = { link = "DiagnosticError" },
        NotifyWARNTitle = { link = "DiagnosticWarn" },
        NotifyINFOTitle = { link = "DiagnosticInfo" },
        NotifyHINTTitle = { link = "DiagnosticHint" },
        NotifyDEBUGTitle = { link = "Debug" },
        NotifyTRACETitle = { link = "Comment" },
        -- Dap-UI
        -- DapUIVariable = { link = "Normal" },
        DapUIScope = { link = "Special" },
        DapUIType = { link = "Type" },
        -- DapUIValue = { link = "Normal" },
        DapUIModifiedValue = { fg = colors.sp, bold = true },
        DapUIDecoration = { fg = colors.fg_border },
        DapUIThread = { fg = colors.id },
        DapUIStoppedThread = { fg = colors.sp },
        -- DapUIFrameName = { link = "Normal"},
        DapUISource = { fg = colors.sp2 },
        DapUILineNumber = { fg = colors.sp },
        DapUIFloatBorder = { fg = colors.fg_border },
        DapUIWatchesEmpty = { fg = colors.diag.error },
        DapUIWatchesValue = { fg = colors.id },
        DapUIWatchesError = { fg = colors.diag.error },
        DapUIBreakpointsPath = { link = "Directory" },
        DapUIBreakpointsInfo = { fg = colors.diag.info },
        DapUIBreakpointsCurrentLine = { fg = colors.id, bold = true },
        -- DapUIBreakpointsLine = {}, -- DapUILineNumber"
        DapUIBreakpointsDisabledLine = { link = "Comment" },
        -- DapUICurrentFrameName = {}, -- DapUIBreakpointsCurrentLine"
        DapUIStepOver = { fg = colors.sp },
        DapUIStepInto = { fg = colors.sp },
        DapUIStepBack = { fg = colors.sp },
        DapUIStepOut = { fg = colors.sp },
        DapUIStop = { fg = colors.diag.error },
        DapUIPlayPause = { fg = colors.st },
        DapUIRestart = { fg = colors.st },
        DapUIUnavailable = { fg = colors.fg_comment },
        -- Floaterm
        FloatermBorder = { fg = colors.fg_border, bg = colors.bg },
        -- NeoVim                         = {},
        healthError = { fg = colors.diag.error },
        healthSuccess = { fg = colors.st },
        healthWarning = { fg = colors.diag.warning },
        -- Cmp
        CmpDocumentation = { link = "NormalFloat" },
        CmpDocumentationBorder = { link = "FloatBorder" },
        CmpCompletion = { link = "Pmenu" },
        CmpCompletionSel = { fg = "NONE", bg = colors.bg_menu_sel },
        CmpCompletionBorder = { fg = colors.bg_search, bg = colors.bg_menu },
        CmpCompletionThumb = { link = "PmenuThumb" },
        CmpCompletionSbar = { link = "PmenuSbar" },
        CmpItemAbbr = { fg = colors.fg_menu },
        CmpItemAbbrDeprecated = { fg = colors.fg_comment, strikethrough = true },
        CmpItemAbbrMatch = { fg = colors.fn },
        CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
        CmpItemKindDefault = { fg = colors.dep },
        CmpItemMenu = { fg = colors.fg_comment },
        CmpItemKindVariable = { fg = colors.fg_dark },
        CmpItemKindFunction = { link = "Function" },
        CmpItemKindMethod = { link = "Function" },
        CmpItemKindConstructor = { link = "TSConstructor" },
        CmpItemKindClass = { link = "Type" },
        CmpItemKindInterface = { link = "Type" },
        CmpItemKindStruct = { link = "Type" },
        CmpItemKindProperty = { link = "TSProperty" },
        CmpItemKindField = { link = "TSField" },
        CmpItemKindEnum = { link = "Identifier" },
        CmpItemKindSnippet = { fg = colors.sp },
        CmpItemKindText = { link = "TSText" },
        CmpItemKindModule = { link = "TSInclude" },
        CmpItemKindFile = { link = "Directory" },
        CmpItemKindFolder = { link = "Directory" },
        CmpItemKindKeyword = { link = "TSKeyword" },
        CmpItemKindTypeParameter = { link = "Identifier" },
        CmpItemKindConstant = { link = "Constant" },
        CmpItemKindOperator = { link = "Operator" },
        CmpItemKindReference = { link = "TSParameterReference" },
        CmpItemKindEnumMember = { link = "TSField" },
        CmpItemKindValue = { link = "String" },
        -- CmpItemKindUnit = {},
        -- CmpItemKindEvent = {},
        -- CmpItemKindColor = {},

        CmpItemKindCopilot = { link = "String" },
        -- IndentBlankline
        IndentBlanklineChar = { fg = colors.bg_light2 },
        IndentBlanklineSpaceChar = { fg = colors.bg_light2 },
        IndentBlanklineSpaceCharBlankline = { fg = colors.bg_light2 },
        IndentBlanklineContextChar = { fg = colors.bg_light3 },
        IndentBlanklineContextStart = { sp = colors.bg_light3, underline = true },
    }

    for hl, specs in pairs(config.overrides) do
        if hlgroups[hl] and not vim.tbl_isempty(specs) then
            hlgroups[hl].link = nil
        end
        hlgroups[hl] = vim.tbl_extend("force", hlgroups[hl] or {}, specs)
    end

    if config.terminalColors then
        setup_terminal_colors(colors)
    end

    return hlgroups
end

return M
