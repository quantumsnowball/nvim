-- default theme
--vim.cmd('colorscheme FourSeasons-Winter')

-- module
local M = {}

M.setup = function(palette)
    local groups = {
        Normal = {
            fg = palette.white,
            bg = palette.base2,
        },
        NormalFloat = {
            bg = palette.base1,
        },
        Pmenu = {
            fg = palette.white,
            bg = palette.base3,
        },
        PmenuSel = {
            fg = palette.base4,
            bg = palette.orange,
        },
        PmenuSelBold = {
            fg = palette.base4,
            bg = palette.orange,
        },
        PmenuThumb = {
            fg = palette.purple,
            bg = palette.green,
        },
        PmenuSbar = {
            bg = palette.base3,
        },
        Cursor = {
            -- style = 'reverse',
        },
        ColorColumn = {
            bg = palette.base3,
        },
        CursorLine = {
            bg = palette.base3,
        },
        NonText = { -- used for "eol", "extends" and "precedes" in listchars
            fg = palette.base5,
        },
        Visual = {
            bg = palette.base4,
        },
        VisualNOS = {
            bg = palette.base3,
        },
        Search = {
            fg = palette.base2,
            bg = palette.yellow,
        },
        IncSearch = {
            fg = palette.base2,
            bg = palette.orange,
        },
        CursorLineNr = {
            fg = palette.orange,
            bg = palette.base2,
        },
        MatchParen = {
            fg = palette.pink,
        },
        Question = {
            fg = palette.yellow,
        },
        ModeMsg = {
            fg = palette.white,
            -- style = 'bold',
        },
        MoreMsg = {
            fg = palette.white,
            -- style = 'bold',
        },
        ErrorMsg = {
            fg = palette.red,
            -- style = 'bold',
        },
        WarningMsg = {
            fg = palette.yellow,
            -- style = 'bold',
        },
        VertSplit = {
            fg = palette.brown,
        },
        LineNr = {
            fg = palette.base5,
            bg = palette.base2,
        },
        SignColumn = {
            fg = palette.white,
            bg = palette.base2,
        },
        StatusLine = {
            fg = palette.base7,
            bg = palette.base3,
        },
        StatusLineNC = {
            fg = palette.grey,
            bg = palette.base3,
        },
        Tabline = {},
        TabLineFill = {},
        TabLineSel = {
            bg = palette.base4,
        },
        SpellBad = {
            fg = palette.red,
            -- style = 'undercurl',
        },
        SpellCap = {
            fg = palette.purple,
            -- style = 'undercurl',
        },
        SpellRare = {
            fg = palette.aqua,
            -- style = 'undercurl',
        },
        SpellLocal = {
            fg = palette.pink,
            -- style = 'undercurl',
        },
        SpecialKey = {
            fg = palette.pink,
        },
        Title = {
            fg = palette.yellow,
            -- style = 'bold',
        },
        Directory = {
            fg = palette.aqua,
        },
        DiffAdd = {
            bg = palette.diff_add,
        },
        DiffDelete = {
            bg = palette.diff_remove,
        },
        DiffChange = {
            bg = palette.diff_change,
        },
        DiffText = {
            bg = palette.diff_text,
        },
        diffAdded = {
            fg = palette.green,
        },
        diffRemoved = {
            fg = palette.pink,
        },
        Folded = {
            fg = palette.grey,
            bg = palette.base3,
        },
        FoldColumn = {
            fg = palette.white,
            bg = palette.black,
        },
        Constant = {
            fg = palette.aqua,
        },
        Number = {
            fg = palette.purple,
        },
        Float = {
            fg = palette.purple,
        },
        Boolean = {
            fg = palette.purple,
        },
        Character = {
            fg = palette.yellow,
        },
        String = {
            fg = palette.yellow,
        },
        Type = {
            fg = palette.aqua,
        },
        Structure = {
            fg = palette.aqua,
        },
        StorageClass = {
            fg = palette.aqua,
        },
        Typedef = {
            fg = palette.aqua,
        },
        Identifier = {
            fg = palette.white,
        },
        Function = {
            fg = palette.green,
            -- style = 'italic',
        },
        Statement = {
            fg = palette.pink,
        },
        Operator = {
            fg = palette.pink,
        },
        Label = {
            fg = palette.pink,
        },
        Keyword = {
            fg = palette.pink,
            -- style = 'italic',
        },
        PreProc = {
            fg = palette.green,
        },
        Include = {
            fg = palette.pink,
            -- style = 'italic',
        },
        Define = {
            fg = palette.pink,
        },
        Macro = {
            fg = palette.pink,
        },
        PreCondit = {
            fg = palette.pink,
        },
        Special = {
            fg = palette.white,
        },
        SpecialChar = {
            fg = palette.pink,
        },
        Delimiter = {
            fg = palette.white,
        },
        SpecialComment = {
            fg = palette.grey,
            -- style = 'italic',
        },
        Tag = {
            fg = palette.orange,
        },
        Todo = {
            fg = palette.orange,
        },
        Comment = {
            fg = palette.base6,
            -- style = 'italic',
        },
        Underlined = {
            -- style = 'underline',
        },
        Ignore = {},
        Error = {
            fg = palette.red,
        },
        Terminal = {
            fg = palette.white,
            bg = palette.base2,
        },
        EndOfBuffer = {
            fg = palette.base2,
        },
        Conceal = {
            fg = palette.grey,
        },
        vCursor = {
            -- style = 'reverse',
        },
        iCursor = {
            -- style = 'reverse',
        },
        lCursor = {
            -- style = 'reverse',
        },
        CursorIM = {
            -- style = 'reverse',
        },
        CursorColumn = {
            bg = palette.base3,
        },
        Whitespace = { -- used for "nbsp", "space", "tab" and "trail" in listchars
            fg = palette.base5,
        },
        WildMenu = {
            fg = palette.white,
            bg = palette.orange,
        },
        QuickFixLine = {
            fg = palette.purple,
            -- style = 'bold',
        },
        Debug = {
            fg = palette.orange,
        },
        debugBreakpoint = {
            fg = palette.base2,
            bg = palette.red,
        },
        Conditional = {
            fg = palette.pink,
        },
        Repeat = {
            fg = palette.pink,
        },
        Exception = {
            fg = palette.pink,
        },
    }

    -- set hl groups
    local str = 'string'
    for name, val in pairs(groups) do
        vim.api.nvim_set_hl(0, name, val)
    end
end

return M
