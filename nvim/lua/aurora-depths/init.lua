-- Aurora Depths 2026 Edition - A modern, cozy theme
-- Embracing Digital Hygge and pastel warmth with WCAG AA accessibility

local M = {}

-- Color Palette - 2026 Edition
M.colors = {
	-- Background hierarchy (depth layers)
	bg0 = "#1a1d26", -- Deepest background
	bg1 = "#252936", -- Elevated surfaces
	bg2 = "#2e3340", -- Panels, floating windows
	bg3 = "#3a3f4f", -- Selections, visual mode
	bg4 = "#4a5163", -- Borders, separators

	-- Foreground hierarchy
	fg0 = "#e5eaf2", -- Primary text (13:1 contrast)
	fg1 = "#b8c5d4", -- Secondary text, comments (8:1)
	fg2 = "#8a95a6", -- Muted text, placeholders (5:1)
	fg3 = "#6a7586", -- Disabled, line numbers (3.5:1)

	-- Accent colors - 2026 Edition (all maintain 4.5:1+ contrast on bg0)
	blue = "#91c4d8", -- Soft Sky - keywords, operators
	-- teal = "#7dd3c4", -- Vibrant Teal - functions, methods (2026 hero color)
	teal = "#6ec9b8",
	mauve = "#d4a5c9", -- Mauve - types, classes (2026 trend)
	sage = "#a3c9a8", -- Sage - strings, literals
	mint = "#8fcf9a", -- Mint - success, booleans
	yellow = "#e6c783", -- Yellow - warnings, cautions
	peach = "#e0a88c", -- Peach - numbers, constants
	rose = "#c9a0b8", -- Rose - imports, special keywords
	coral = "#d4878f", -- Coral - errors, deletions
	lavender = "#b4a7d6", -- Lavender - variables, parameters

	-- Legacy aliases (for compatibility)
	cyan = "#a3c9a8", -- Maps to sage
	green = "#8fcf9a", -- Maps to mint
	orange = "#e0a88c", -- Maps to peach
	pink = "#c9a0b8", -- Maps to rose
	red = "#d4878f", -- Maps to coral
	purple = "#b4a7d6", -- Maps to lavender

	-- Special colors
	none = "NONE",
}

local colors = M.colors

-- Helper function to set highlight groups
local function hi(group, opts)
	local cmd = "highlight " .. group
	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end
	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end
	if opts.sp then
		cmd = cmd .. " guisp=" .. opts.sp
	end
	if opts.style then
		cmd = cmd .. " gui=" .. opts.style
	else
		cmd = cmd .. " gui=NONE"
	end
	vim.cmd(cmd)
end

function M.setup()
	-- Reset highlighting
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "aurora-depths"

	-- Editor UI
	hi("Normal", { fg = colors.fg0, bg = colors.bg0 })
	hi("NormalFloat", { fg = colors.fg0, bg = colors.bg1 })
	hi("NormalNC", { fg = colors.fg1, bg = colors.bg0 })
	hi("FloatBorder", { fg = colors.bg4, bg = colors.bg1 })
	hi("FloatTitle", { fg = colors.fg0, bg = colors.bg1, style = "bold" })

	-- Cursor & Lines
	hi("Cursor", { fg = colors.bg0, bg = colors.fg0 })
	hi("CursorLine", { bg = colors.bg1 })
	hi("CursorLineNr", { fg = colors.yellow, bg = colors.bg1, style = "bold" })
	hi("CursorColumn", { bg = colors.bg1 })
	hi("ColorColumn", { bg = colors.bg1 })
	hi("LineNr", { fg = colors.fg3, bg = colors.none })
	hi("SignColumn", { fg = colors.fg3, bg = colors.bg0 })
	hi("VertSplit", { fg = colors.bg4, bg = colors.none })
	hi("WinSeparator", { fg = colors.bg4, bg = colors.none })

	-- Search & Selection
	hi("Visual", { bg = colors.bg3 })
	hi("VisualNOS", { bg = colors.bg3 })
	hi("Search", { fg = colors.bg0, bg = colors.yellow })
	hi("IncSearch", { fg = colors.bg0, bg = colors.orange })
	hi("CurSearch", { fg = colors.bg0, bg = colors.orange, style = "bold" })
	hi("Substitute", { fg = colors.bg0, bg = colors.red })

	-- Statusline & Tabline
	hi("StatusLine", { fg = colors.fg0, bg = colors.bg2 })
	hi("StatusLineNC", { fg = colors.fg2, bg = colors.bg1 })
	hi("TabLine", { fg = colors.fg2, bg = colors.bg1 })
	hi("TabLineFill", { bg = colors.bg0 })
	hi("TabLineSel", { fg = colors.fg0, bg = colors.bg2, style = "bold" })
	hi("WinBar", { fg = colors.fg1, bg = colors.bg0 })
	hi("WinBarNC", { fg = colors.fg2, bg = colors.bg0 })

	-- Popup Menu
	hi("Pmenu", { fg = colors.fg0, bg = colors.bg2 })
	hi("PmenuSel", { fg = colors.fg0, bg = colors.bg3 })
	hi("PmenuSbar", { bg = colors.bg2 })
	hi("PmenuThumb", { bg = colors.bg4 })

	-- Messages & Mode
	hi("ModeMsg", { fg = colors.fg0, style = "bold" })
	hi("MoreMsg", { fg = colors.teal })
	hi("Question", { fg = colors.teal })
	hi("ErrorMsg", { fg = colors.red, style = "bold" })
	hi("WarningMsg", { fg = colors.yellow, style = "bold" })
	hi("Title", { fg = colors.blue, style = "bold" })

	-- Folds & Conceal
	hi("Folded", { fg = colors.fg2, bg = colors.bg1 })
	hi("FoldColumn", { fg = colors.fg3, bg = colors.bg0 })
	hi("Conceal", { fg = colors.fg2 })

	-- Diff
	hi("DiffAdd", { fg = colors.green, bg = "#2a3325" })
	hi("DiffChange", { fg = colors.yellow, bg = "#3a3525" })
	hi("DiffDelete", { fg = colors.red, bg = "#352530" })
	hi("DiffText", { fg = colors.fg0, bg = "#4a4535", style = "bold" })
	hi("Added", { fg = colors.green })
	hi("Changed", { fg = colors.yellow })
	hi("Removed", { fg = colors.red })

	-- Spelling
	hi("SpellBad", { sp = colors.red, style = "undercurl" })
	hi("SpellCap", { sp = colors.yellow, style = "undercurl" })
	hi("SpellLocal", { sp = colors.cyan, style = "undercurl" })
	hi("SpellRare", { sp = colors.purple, style = "undercurl" })

	-- Misc UI
	hi("Directory", { fg = colors.blue })
	hi("EndOfBuffer", { fg = colors.bg2 })
	hi("MatchParen", { fg = colors.yellow, bg = colors.bg3, style = "bold" })
	hi("NonText", { fg = colors.bg4 })
	hi("SpecialKey", { fg = colors.bg4 })
	hi("Whitespace", { fg = colors.bg3 })
	hi("WildMenu", { fg = colors.bg0, bg = colors.blue })

	-- Syntax Highlighting
	hi("Comment", { fg = colors.fg2, style = "italic" })

	hi("Constant", { fg = colors.peach })
	hi("String", { fg = colors.sage })
	hi("Character", { fg = colors.sage })
	hi("Number", { fg = colors.peach })
	hi("Boolean", { fg = colors.mint })
	hi("Float", { fg = colors.peach })

	hi("Identifier", { fg = colors.fg0 })
	hi("Function", { fg = colors.teal })

	hi("Statement", { fg = colors.blue })
	hi("Conditional", { fg = colors.blue })
	hi("Repeat", { fg = colors.blue })
	hi("Label", { fg = colors.blue })
	hi("Operator", { fg = colors.blue })
	hi("Keyword", { fg = colors.blue })
	hi("Exception", { fg = colors.coral })

	hi("PreProc", { fg = colors.rose })
	hi("Include", { fg = colors.rose })
	hi("Define", { fg = colors.rose })
	hi("Macro", { fg = colors.rose })
	hi("PreCondit", { fg = colors.rose })

	hi("Type", { fg = colors.mauve })
	hi("StorageClass", { fg = colors.mauve })
	hi("Structure", { fg = colors.mauve })
	hi("Typedef", { fg = colors.mauve })

	hi("Special", { fg = colors.lavender })
	hi("SpecialChar", { fg = colors.lavender })
	hi("Tag", { fg = colors.blue })
	hi("Delimiter", { fg = colors.fg1 })
	hi("SpecialComment", { fg = colors.fg2, style = "bold" })
	hi("Debug", { fg = colors.coral })

	hi("Underlined", { fg = colors.blue, style = "underline" })
	hi("Ignore", { fg = colors.fg3 })
	hi("Error", { fg = colors.coral, style = "bold" })
	hi("Todo", { fg = colors.bg0, bg = colors.yellow, style = "bold" })

	-- Treesitter Highlights
	hi("@variable", { fg = colors.fg0 })
	hi("@variable.builtin", { fg = colors.lavender })
	hi("@variable.parameter", { fg = colors.lavender, style = "italic" })
	hi("@variable.member", { fg = colors.fg0 })

	hi("@constant", { fg = colors.peach })
	hi("@constant.builtin", { fg = colors.peach, style = "bold" })
	hi("@constant.macro", { fg = colors.peach })

	hi("@module", { fg = colors.mauve })
	hi("@label", { fg = colors.blue })

	hi("@string", { fg = colors.sage })
	hi("@string.documentation", { fg = colors.sage, style = "italic" })
	hi("@string.regexp", { fg = colors.rose })
	hi("@string.escape", { fg = colors.rose })
	hi("@string.special", { fg = colors.yellow })

	hi("@character", { fg = colors.sage })
	hi("@character.special", { fg = colors.lavender })

	hi("@boolean", { fg = colors.mint })
	hi("@number", { fg = colors.peach })
	hi("@number.float", { fg = colors.peach })

	hi("@type", { fg = colors.mauve })
	hi("@type.builtin", { fg = colors.mauve, style = "italic" })
	hi("@type.definition", { fg = colors.mauve })

	hi("@attribute", { fg = colors.lavender })
	hi("@property", { fg = colors.fg0 })

	hi("@function", { fg = colors.teal })
	hi("@function.builtin", { fg = colors.teal, style = "italic" })
	hi("@function.call", { fg = colors.teal })
	hi("@function.method", { fg = colors.teal })
	hi("@function.method.call", { fg = colors.teal })
	hi("@function.macro", { fg = colors.rose })

	hi("@constructor", { fg = colors.mauve })

	hi("@operator", { fg = colors.blue })

	hi("@keyword", { fg = colors.blue })
	hi("@keyword.coroutine", { fg = colors.blue })
	hi("@keyword.function", { fg = colors.blue })
	hi("@keyword.operator", { fg = colors.blue })
	hi("@keyword.import", { fg = colors.rose })
	hi("@keyword.storage", { fg = colors.blue })
	hi("@keyword.repeat", { fg = colors.blue })
	hi("@keyword.return", { fg = colors.blue })
	hi("@keyword.debug", { fg = colors.coral })
	hi("@keyword.exception", { fg = colors.coral })
	hi("@keyword.conditional", { fg = colors.blue })
	hi("@keyword.conditional.ternary", { fg = colors.blue })
	hi("@keyword.directive", { fg = colors.rose })
	hi("@keyword.directive.define", { fg = colors.rose })

	hi("@punctuation.delimiter", { fg = colors.fg1 })
	hi("@punctuation.bracket", { fg = colors.fg1 })
	hi("@punctuation.special", { fg = colors.lavender })

	hi("@comment", { fg = colors.fg2, style = "italic" })
	hi("@comment.documentation", { fg = colors.fg2, style = "italic" })
	hi("@comment.error", { fg = colors.coral, style = "bold" })
	hi("@comment.warning", { fg = colors.yellow, style = "bold" })
	hi("@comment.todo", { fg = colors.bg0, bg = colors.yellow, style = "bold" })
	hi("@comment.note", { fg = colors.bg0, bg = colors.teal, style = "bold" })

	hi("@markup.strong", { style = "bold" })
	hi("@markup.italic", { style = "italic" })
	hi("@markup.strikethrough", { style = "strikethrough" })
	hi("@markup.underline", { style = "underline" })
	hi("@markup.heading", { fg = colors.blue, style = "bold" })
	hi("@markup.quote", { fg = colors.fg1, style = "italic" })
	hi("@markup.math", { fg = colors.lavender })
	hi("@markup.link", { fg = colors.blue, style = "underline" })
	hi("@markup.link.label", { fg = colors.sage })
	hi("@markup.link.url", { fg = colors.blue, style = "underline" })
	hi("@markup.raw", { fg = colors.sage })
	hi("@markup.raw.block", { fg = colors.fg0 })
	hi("@markup.list", { fg = colors.blue })
	hi("@markup.list.checked", { fg = colors.mint })
	hi("@markup.list.unchecked", { fg = colors.fg2 })

	hi("@diff.plus", { fg = colors.mint })
	hi("@diff.minus", { fg = colors.coral })
	hi("@diff.delta", { fg = colors.yellow })

	hi("@tag", { fg = colors.blue })
	hi("@tag.attribute", { fg = colors.lavender })
	hi("@tag.delimiter", { fg = colors.fg1 })

	-- LSP Semantic Tokens
	hi("@lsp.type.class", { fg = colors.mauve })
	hi("@lsp.type.decorator", { fg = colors.lavender })
	hi("@lsp.type.enum", { fg = colors.mauve })
	hi("@lsp.type.enumMember", { fg = colors.peach })
	hi("@lsp.type.function", { fg = colors.teal })
	hi("@lsp.type.interface", { fg = colors.mauve })
	hi("@lsp.type.macro", { fg = colors.rose })
	hi("@lsp.type.method", { fg = colors.teal })
	hi("@lsp.type.namespace", { fg = colors.mauve })
	hi("@lsp.type.parameter", { fg = colors.lavender, style = "italic" })
	hi("@lsp.type.property", { fg = colors.fg0 })
	hi("@lsp.type.struct", { fg = colors.mauve })
	hi("@lsp.type.type", { fg = colors.mauve })
	hi("@lsp.type.typeParameter", { fg = colors.mauve, style = "italic" })
	hi("@lsp.type.variable", { fg = colors.fg0 })
	hi("@lsp.mod.deprecated", { style = "strikethrough" })
	hi("@lsp.mod.readonly", { style = "italic" })

	-- Diagnostics
	hi("DiagnosticError", { fg = colors.coral })
	hi("DiagnosticWarn", { fg = colors.yellow })
	hi("DiagnosticInfo", { fg = colors.blue })
	hi("DiagnosticHint", { fg = colors.teal })
	hi("DiagnosticOk", { fg = colors.mint })

	hi("DiagnosticVirtualTextError", { fg = colors.coral, bg = "#352832" })
	hi("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = "#3a3525" })
	hi("DiagnosticVirtualTextInfo", { fg = colors.blue, bg = "#253545" })
	hi("DiagnosticVirtualTextHint", { fg = colors.teal, bg = "#253835" })
	hi("DiagnosticVirtualTextOk", { fg = colors.mint, bg = "#2a3328" })

	hi("DiagnosticUnderlineError", { sp = colors.coral, style = "undercurl" })
	hi("DiagnosticUnderlineWarn", { sp = colors.yellow, style = "undercurl" })
	hi("DiagnosticUnderlineInfo", { sp = colors.blue, style = "undercurl" })
	hi("DiagnosticUnderlineHint", { sp = colors.teal, style = "undercurl" })
	hi("DiagnosticUnderlineOk", { sp = colors.mint, style = "undercurl" })

	hi("DiagnosticFloatingError", { fg = colors.coral })
	hi("DiagnosticFloatingWarn", { fg = colors.yellow })
	hi("DiagnosticFloatingInfo", { fg = colors.blue })
	hi("DiagnosticFloatingHint", { fg = colors.teal })
	hi("DiagnosticFloatingOk", { fg = colors.mint })

	hi("DiagnosticSignError", { fg = colors.coral })
	hi("DiagnosticSignWarn", { fg = colors.yellow })
	hi("DiagnosticSignInfo", { fg = colors.blue })
	hi("DiagnosticSignHint", { fg = colors.teal })
	hi("DiagnosticSignOk", { fg = colors.mint })

	-- Git Signs
	hi("GitSignsAdd", { fg = colors.mint })
	hi("GitSignsChange", { fg = colors.yellow })
	hi("GitSignsDelete", { fg = colors.coral })
	hi("GitSignsCurrentLineBlame", { fg = colors.fg3, style = "italic" })

	-- Telescope
	hi("TelescopeBorder", { fg = colors.bg4, bg = colors.bg1 })
	hi("TelescopeNormal", { fg = colors.fg0, bg = colors.bg1 })
	hi("TelescopePreviewTitle", { fg = colors.bg0, bg = colors.teal, style = "bold" })
	hi("TelescopePromptTitle", { fg = colors.bg0, bg = colors.blue, style = "bold" })
	hi("TelescopeResultsTitle", { fg = colors.bg0, bg = colors.lavender, style = "bold" })
	hi("TelescopeSelection", { fg = colors.fg0, bg = colors.bg3 })
	hi("TelescopeSelectionCaret", { fg = colors.teal, bg = colors.bg3 })
	hi("TelescopeMatching", { fg = colors.teal, style = "bold" })
	hi("TelescopePromptPrefix", { fg = colors.teal })

	-- NvimTree / Neo-tree
	hi("NvimTreeNormal", { fg = colors.fg0, bg = colors.bg0 })
	hi("NvimTreeFolderIcon", { fg = colors.blue })
	hi("NvimTreeFolderName", { fg = colors.blue })
	hi("NvimTreeOpenedFolderName", { fg = colors.blue, style = "bold" })
	hi("NvimTreeRootFolder", { fg = colors.lavender, style = "bold" })
	hi("NvimTreeGitDirty", { fg = colors.yellow })
	hi("NvimTreeGitNew", { fg = colors.mint })
	hi("NvimTreeGitDeleted", { fg = colors.coral })
	hi("NvimTreeSpecialFile", { fg = colors.rose })
	hi("NvimTreeIndentMarker", { fg = colors.bg4 })

	hi("NeoTreeNormal", { fg = colors.fg0, bg = colors.bg0 })
	hi("NeoTreeNormalNC", { fg = colors.fg1, bg = colors.bg0 })
	hi("NeoTreeDirectoryIcon", { fg = colors.blue })
	hi("NeoTreeDirectoryName", { fg = colors.blue })
	hi("NeoTreeRootName", { fg = colors.lavender, style = "bold" })
	hi("NeoTreeGitAdded", { fg = colors.mint })
	hi("NeoTreeGitModified", { fg = colors.yellow })
	hi("NeoTreeGitDeleted", { fg = colors.coral })
	hi("NeoTreeGitConflict", { fg = colors.coral, style = "bold" })
	hi("NeoTreeGitUntracked", { fg = colors.peach })

	-- Indent Blankline
	hi("IndentBlanklineChar", { fg = colors.bg3 })
	hi("IndentBlanklineContextChar", { fg = colors.bg4 })
	hi("IblIndent", { fg = colors.bg3 })
	hi("IblScope", { fg = colors.bg4 })

	-- Which-key
	hi("WhichKey", { fg = colors.teal })
	hi("WhichKeyGroup", { fg = colors.blue })
	hi("WhichKeyDesc", { fg = colors.fg0 })
	hi("WhichKeySeparator", { fg = colors.fg3 })
	hi("WhichKeyFloat", { bg = colors.bg1 })
	hi("WhichKeyBorder", { fg = colors.bg4, bg = colors.bg1 })

	-- Lazy.nvim
	hi("LazyH1", { fg = colors.bg0, bg = colors.blue, style = "bold" })
	hi("LazyButton", { fg = colors.fg0, bg = colors.bg2 })
	hi("LazyButtonActive", { fg = colors.bg0, bg = colors.teal, style = "bold" })
	hi("LazySpecial", { fg = colors.teal })

	-- Mason
	hi("MasonHeader", { fg = colors.bg0, bg = colors.blue, style = "bold" })
	hi("MasonHighlight", { fg = colors.teal })
	hi("MasonHighlightBlock", { fg = colors.bg0, bg = colors.teal })
	hi("MasonHighlightBlockBold", { fg = colors.bg0, bg = colors.teal, style = "bold" })
	hi("MasonMuted", { fg = colors.fg2 })
	hi("MasonMutedBlock", { fg = colors.bg0, bg = colors.fg2 })

	-- Notify
	hi("NotifyERRORBorder", { fg = colors.coral })
	hi("NotifyWARNBorder", { fg = colors.yellow })
	hi("NotifyINFOBorder", { fg = colors.blue })
	hi("NotifyDEBUGBorder", { fg = colors.fg2 })
	hi("NotifyTRACEBorder", { fg = colors.lavender })
	hi("NotifyERRORIcon", { fg = colors.coral })
	hi("NotifyWARNIcon", { fg = colors.yellow })
	hi("NotifyINFOIcon", { fg = colors.blue })
	hi("NotifyDEBUGIcon", { fg = colors.fg2 })
	hi("NotifyTRACEIcon", { fg = colors.lavender })
	hi("NotifyERRORTitle", { fg = colors.coral, style = "bold" })
	hi("NotifyWARNTitle", { fg = colors.yellow, style = "bold" })
	hi("NotifyINFOTitle", { fg = colors.blue, style = "bold" })
	hi("NotifyDEBUGTitle", { fg = colors.fg2, style = "bold" })
	hi("NotifyTRACETitle", { fg = colors.lavender, style = "bold" })
	hi("NotifyERRORBody", { fg = colors.fg0 })
	hi("NotifyWARNBody", { fg = colors.fg0 })
	hi("NotifyINFOBody", { fg = colors.fg0 })
	hi("NotifyDEBUGBody", { fg = colors.fg0 })
	hi("NotifyTRACEBody", { fg = colors.fg0 })

	-- Cmp (completion)
	hi("CmpItemAbbr", { fg = colors.fg0 })
	hi("CmpItemAbbrDeprecated", { fg = colors.fg2, style = "strikethrough" })
	hi("CmpItemAbbrMatch", { fg = colors.teal, style = "bold" })
	hi("CmpItemAbbrMatchFuzzy", { fg = colors.teal })
	hi("CmpItemKind", { fg = colors.lavender })
	hi("CmpItemMenu", { fg = colors.fg2 })
	hi("CmpItemKindClass", { fg = colors.mauve })
	hi("CmpItemKindColor", { fg = colors.rose })
	hi("CmpItemKindConstant", { fg = colors.peach })
	hi("CmpItemKindConstructor", { fg = colors.mauve })
	hi("CmpItemKindEnum", { fg = colors.mauve })
	hi("CmpItemKindEnumMember", { fg = colors.peach })
	hi("CmpItemKindEvent", { fg = colors.lavender })
	hi("CmpItemKindField", { fg = colors.fg0 })
	hi("CmpItemKindFile", { fg = colors.blue })
	hi("CmpItemKindFolder", { fg = colors.blue })
	hi("CmpItemKindFunction", { fg = colors.teal })
	hi("CmpItemKindInterface", { fg = colors.mauve })
	hi("CmpItemKindKeyword", { fg = colors.blue })
	hi("CmpItemKindMethod", { fg = colors.teal })
	hi("CmpItemKindModule", { fg = colors.mauve })
	hi("CmpItemKindOperator", { fg = colors.blue })
	hi("CmpItemKindProperty", { fg = colors.fg0 })
	hi("CmpItemKindReference", { fg = colors.lavender })
	hi("CmpItemKindSnippet", { fg = colors.sage })
	hi("CmpItemKindStruct", { fg = colors.mauve })
	hi("CmpItemKindText", { fg = colors.fg1 })
	hi("CmpItemKindTypeParameter", { fg = colors.mauve })
	hi("CmpItemKindUnit", { fg = colors.peach })
	hi("CmpItemKindValue", { fg = colors.peach })
	hi("CmpItemKindVariable", { fg = colors.lavender })

	-- Noice
	hi("NoiceCmdline", { fg = colors.fg0, bg = colors.bg1 })
	hi("NoiceCmdlineIcon", { fg = colors.teal })
	hi("NoiceCmdlineIconSearch", { fg = colors.yellow })
	hi("NoiceCmdlinePopup", { fg = colors.fg0, bg = colors.bg1 })
	hi("NoiceCmdlinePopupBorder", { fg = colors.bg4, bg = colors.bg1 })
	hi("NoiceCmdlinePrompt", { fg = colors.teal })
	hi("NoiceConfirm", { fg = colors.fg0, bg = colors.bg1 })
	hi("NoiceConfirmBorder", { fg = colors.bg4, bg = colors.bg1 })

	-- Dashboard / Alpha
	hi("DashboardHeader", { fg = colors.teal })
	hi("DashboardFooter", { fg = colors.fg2, style = "italic" })
	hi("DashboardCenter", { fg = colors.blue })
	hi("DashboardShortcut", { fg = colors.lavender })
	hi("DashboardIcon", { fg = colors.teal })
	hi("DashboardDesc", { fg = colors.fg0 })
	hi("DashboardKey", { fg = colors.yellow })

	hi("AlphaHeader", { fg = colors.teal })
	hi("AlphaButtons", { fg = colors.blue })
	hi("AlphaShortcut", { fg = colors.lavender })
	hi("AlphaFooter", { fg = colors.fg2, style = "italic" })

	-- Bufferline (highlight groups for when not using the integration function)
	hi("BufferLineFill", { bg = colors.bg0 })
	hi("BufferLineBackground", { fg = colors.fg2, bg = colors.bg1 })
	hi("BufferLineBuffer", { fg = colors.fg2, bg = colors.bg1 })
	hi("BufferLineBufferSelected", { fg = colors.fg0, bg = colors.bg0, style = "bold" })
	hi("BufferLineBufferVisible", { fg = colors.fg1, bg = colors.bg0 })
	hi("BufferLineCloseButton", { fg = colors.fg2, bg = colors.bg1 })
	hi("BufferLineCloseButtonSelected", { fg = colors.coral, bg = colors.bg0 })
	hi("BufferLineCloseButtonVisible", { fg = colors.fg1, bg = colors.bg0 })
	hi("BufferLineIndicatorSelected", { fg = colors.teal, bg = colors.bg0 })
	hi("BufferLineModified", { fg = colors.yellow, bg = colors.bg1 })
	hi("BufferLineModifiedSelected", { fg = colors.yellow, bg = colors.bg0 })
	hi("BufferLineModifiedVisible", { fg = colors.yellow, bg = colors.bg0 })
	hi("BufferLineSeparator", { fg = colors.bg0, bg = colors.bg1 })
	hi("BufferLineSeparatorSelected", { fg = colors.bg0, bg = colors.bg0 })
	hi("BufferLineSeparatorVisible", { fg = colors.bg0, bg = colors.bg0 })

	-- Store lualine theme in global for backwards compatibility
	vim.g.aurora_depths_lualine = M.lualine()
end

-- Lualine theme integration
-- Usage: require('lualine').setup { options = { theme = require('aurora-depths').lualine() } }
function M.lualine()
	return {
		normal = {
			a = { fg = colors.bg0, bg = colors.teal, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		insert = {
			a = { fg = colors.bg0, bg = colors.green, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		visual = {
			a = { fg = colors.bg0, bg = colors.purple, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		replace = {
			a = { fg = colors.bg0, bg = colors.red, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		command = {
			a = { fg = colors.bg0, bg = colors.yellow, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		inactive = {
			a = { fg = colors.fg2, bg = colors.bg1 },
			b = { fg = colors.fg2, bg = colors.bg1 },
			c = { fg = colors.fg2, bg = colors.bg1 },
		},
	}
end

-- Bufferline theme integration
-- Usage: require('bufferline').setup { highlights = require('aurora-depths').bufferline() }
function M.bufferline()
	return {
		fill = { bg = colors.bg0 },
		background = { fg = colors.fg2, bg = colors.bg1 },
		buffer_visible = { fg = colors.fg1, bg = colors.bg0 },
		buffer_selected = { fg = colors.fg0, bg = colors.bg0, bold = true, italic = false },
		close_button = { fg = colors.fg2, bg = colors.bg1 },
		close_button_visible = { fg = colors.fg1, bg = colors.bg0 },
		close_button_selected = { fg = colors.coral, bg = colors.bg0 },
		indicator_visible = { fg = colors.bg0, bg = colors.bg0 },
		indicator_selected = { fg = colors.teal, bg = colors.bg0 },
		modified = { fg = colors.yellow, bg = colors.bg1 },
		modified_visible = { fg = colors.yellow, bg = colors.bg0 },
		modified_selected = { fg = colors.yellow, bg = colors.bg0 },
		duplicate = { fg = colors.fg3, bg = colors.bg1, italic = true },
		duplicate_visible = { fg = colors.fg3, bg = colors.bg0, italic = true },
		duplicate_selected = { fg = colors.fg2, bg = colors.bg0, italic = true },
		separator = { fg = colors.bg0, bg = colors.bg1 },
		separator_visible = { fg = colors.bg0, bg = colors.bg0 },
		separator_selected = { fg = colors.bg0, bg = colors.bg0 },
		tab = { fg = colors.fg2, bg = colors.bg1 },
		tab_selected = { fg = colors.fg0, bg = colors.bg0, bold = true },
		tab_separator = { fg = colors.bg0, bg = colors.bg1 },
		tab_separator_selected = { fg = colors.bg0, bg = colors.bg0 },
		tab_close = { fg = colors.coral, bg = colors.bg1 },
		numbers = { fg = colors.fg3, bg = colors.bg1 },
		numbers_visible = { fg = colors.fg2, bg = colors.bg0 },
		numbers_selected = { fg = colors.teal, bg = colors.bg0, bold = true },
		error = { fg = colors.coral, bg = colors.bg1 },
		error_visible = { fg = colors.coral, bg = colors.bg0 },
		error_selected = { fg = colors.coral, bg = colors.bg0, bold = true },
		error_diagnostic = { fg = colors.coral, bg = colors.bg1 },
		error_diagnostic_visible = { fg = colors.coral, bg = colors.bg0 },
		error_diagnostic_selected = { fg = colors.coral, bg = colors.bg0, bold = true },
		warning = { fg = colors.yellow, bg = colors.bg1 },
		warning_visible = { fg = colors.yellow, bg = colors.bg0 },
		warning_selected = { fg = colors.yellow, bg = colors.bg0, bold = true },
		warning_diagnostic = { fg = colors.yellow, bg = colors.bg1 },
		warning_diagnostic_visible = { fg = colors.yellow, bg = colors.bg0 },
		warning_diagnostic_selected = { fg = colors.yellow, bg = colors.bg0, bold = true },
		info = { fg = colors.blue, bg = colors.bg1 },
		info_visible = { fg = colors.blue, bg = colors.bg0 },
		info_selected = { fg = colors.blue, bg = colors.bg0, bold = true },
		info_diagnostic = { fg = colors.blue, bg = colors.bg1 },
		info_diagnostic_visible = { fg = colors.blue, bg = colors.bg0 },
		info_diagnostic_selected = { fg = colors.blue, bg = colors.bg0, bold = true },
		hint = { fg = colors.teal, bg = colors.bg1 },
		hint_visible = { fg = colors.teal, bg = colors.bg0 },
		hint_selected = { fg = colors.teal, bg = colors.bg0, bold = true },
		hint_diagnostic = { fg = colors.teal, bg = colors.bg1 },
		hint_diagnostic_visible = { fg = colors.teal, bg = colors.bg0 },
		hint_diagnostic_selected = { fg = colors.teal, bg = colors.bg0, bold = true },
		diagnostic = { fg = colors.fg3, bg = colors.bg1 },
		diagnostic_visible = { fg = colors.fg3, bg = colors.bg0 },
		diagnostic_selected = { fg = colors.fg2, bg = colors.bg0, bold = true },
		pick = { fg = colors.rose, bg = colors.bg1, bold = true },
		pick_visible = { fg = colors.rose, bg = colors.bg0, bold = true },
		pick_selected = { fg = colors.rose, bg = colors.bg0, bold = true },
		offset_separator = { fg = colors.bg4, bg = colors.bg0 },
		trunc_marker = { fg = colors.fg3, bg = colors.bg0 },
	}
end

return M
