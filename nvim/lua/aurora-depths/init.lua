-- ══════════════════════════════════════════════════════════════════════════════
-- Aurora Depths - Purple Edition - Neovim Theme
-- Sophisticated purple-first palette with WCAG AA compliance
-- ══════════════════════════════════════════════════════════════════════════════

local M = {}

-- ══════════════════════════════════════════════════════════════════════════════
-- Configuration
-- ══════════════════════════════════════════════════════════════════════════════

M.config = {
	transparent = false, -- Enable transparent background
	transparent_float = false, -- Also make floating windows transparent
	dim_inactive = false, -- Dim inactive windows
	terminal_colors = true, -- Set terminal colors
}

-- Color Palette - Purple Edition
M.colors = {
	-- Background hierarchy (purple-tinted depth layers)
	bg0 = "#1a1825", -- Deepest - purple-black canvas
	bg1 = "#242030", -- Elevated surfaces
	bg2 = "#2e293c", -- Panels, floating windows
	bg3 = "#3a3550", -- Selections, visual mode
	bg4 = "#4a4565", -- Borders, separators

	-- Foreground hierarchy
	fg0 = "#e8e6f0", -- Primary text (12:1 contrast)
	fg1 = "#c4c0d4", -- Secondary text (8:1)
	fg2 = "#908ca4", -- Muted text, comments (5:1)
	fg3 = "#686480", -- Disabled, line numbers (3.5:1)

	-- Primary Purple Family (The Hero)
	purple = "#c4b5f0", -- Functions, methods, primary accent
	-- purple = "#d4c8f8",
	-- violet = "#a78bfa", -- Decorators, properties
	violet = "#c4a8ff",

	-- Pink/Magenta Family - Keywords
	pink = "#f0a0c8", -- Keywords, operators
	-- pink = "#e879a8",
	magenta = "#e879a8", -- Control flow

	-- Complementary - Types
	cyan = "#7dd3d0", -- Types, classes, interfaces
	teal = "#5ccfb8", -- Type parameters

	-- Supporting Accents
	sage = "#a8d4a8", -- Strings
	mint = "#8ce0a0", -- Success, booleans
	yellow = "#e8d088", -- Warnings
	peach = "#e8a888", -- Numbers, constants
	-- coral = "#e88090", -- Errors
	coral = "#f0a0a8",
	sky = "#88c4f0", -- Variables, parameters
	rose = "#e0a8c0", -- Imports

	-- Legacy aliases (for compatibility)
	blue = "#f0a0c8", -- Maps to pink (keywords)
	green = "#8ce0a0", -- Maps to mint
	orange = "#e8a888", -- Maps to peach
	red = "#e88090", -- Maps to coral
	lavender = "#a78bfa", -- Maps to violet

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

-- ══════════════════════════════════════════════════════════════════════════════
-- Setup function with optional configuration
-- ══════════════════════════════════════════════════════════════════════════════
-- Usage:
--   require('aurora-depths').setup()                    -- Default settings
--   require('aurora-depths').setup({ transparent = true })  -- Transparent bg
--
function M.setup(opts)
	-- Merge user config with defaults
	opts = opts or {}
	for k, v in pairs(opts) do
		if M.config[k] ~= nil then
			M.config[k] = v
		end
	end

	local config = M.config

	-- Determine background colors based on transparency setting
	local bg_main = config.transparent and colors.none or colors.bg0
	local bg_inactive = config.dim_inactive and colors.bg1 or bg_main
	local bg_float = config.transparent_float and colors.none or colors.bg1
	local bg_sidebar = config.transparent and colors.none or colors.bg0

	-- Reset highlighting
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "aurora-depths"

	-- ══════════════════════════════════════════════════════════════════════════
	-- Editor UI
	-- ══════════════════════════════════════════════════════════════════════════
	hi("Normal", { fg = colors.fg0, bg = bg_main })
	hi("NormalFloat", { fg = colors.fg0, bg = bg_float })
	hi("NormalNC", { fg = colors.fg1, bg = bg_inactive })
	hi("FloatBorder", { fg = colors.bg4, bg = bg_float })
	hi("FloatTitle", { fg = colors.fg0, bg = bg_float, style = "bold" })

	-- Cursor & Lines
	hi("Cursor", { fg = colors.bg0, bg = colors.fg0 })
	hi("CursorLine", { bg = colors.bg1 })
	hi("CursorLineNr", { fg = colors.purple, bg = colors.bg1, style = "bold" })
	hi("CursorColumn", { bg = colors.bg1 })
	hi("ColorColumn", { bg = colors.bg1 })
	hi("LineNr", { fg = colors.fg3, bg = bg_main })
	hi("SignColumn", { fg = colors.fg3, bg = bg_main })
	hi("VertSplit", { fg = colors.bg4, bg = colors.none })
	hi("WinSeparator", { fg = colors.bg4, bg = colors.none })

	-- Search & Selection
	hi("Visual", { bg = colors.bg3 })
	hi("VisualNOS", { bg = colors.bg3 })
	hi("Search", { fg = colors.bg0, bg = colors.yellow })
	hi("IncSearch", { fg = colors.bg0, bg = colors.peach })
	hi("CurSearch", { fg = colors.bg0, bg = colors.peach, style = "bold" })
	hi("Substitute", { fg = colors.bg0, bg = colors.coral })

	-- Statusline & Tabline
	hi("StatusLine", { fg = colors.fg0, bg = colors.bg2 })
	hi("StatusLineNC", { fg = colors.fg2, bg = colors.bg1 })
	hi("TabLine", { fg = colors.fg2, bg = colors.bg1 })
	hi("TabLineFill", { bg = bg_main })
	hi("TabLineSel", { fg = colors.fg0, bg = colors.bg2, style = "bold" })
	hi("WinBar", { fg = colors.fg1, bg = bg_main })
	hi("WinBarNC", { fg = colors.fg2, bg = bg_main })

	-- Popup Menu
	hi("Pmenu", { fg = colors.fg0, bg = colors.bg2 })
	hi("PmenuSel", { fg = colors.fg0, bg = colors.bg3 })
	hi("PmenuSbar", { bg = colors.bg2 })
	hi("PmenuThumb", { bg = colors.bg4 })

	-- Messages & Mode
	hi("ModeMsg", { fg = colors.fg0, style = "bold" })
	hi("MoreMsg", { fg = colors.purple })
	hi("Question", { fg = colors.purple })
	hi("ErrorMsg", { fg = colors.coral, style = "bold" })
	hi("WarningMsg", { fg = colors.yellow, style = "bold" })
	hi("Title", { fg = colors.purple, style = "bold" })

	-- Folds & Conceal
	hi("Folded", { fg = colors.fg2, bg = colors.bg1 })
	hi("FoldColumn", { fg = colors.fg3, bg = bg_main })
	hi("Conceal", { fg = colors.fg2 })

	-- Diff (purple-tinted backgrounds)
	hi("DiffAdd", { fg = colors.mint, bg = "#252d30" })
	hi("DiffChange", { fg = colors.yellow, bg = "#302c28" })
	hi("DiffDelete", { fg = colors.coral, bg = "#302028" })
	hi("DiffText", { fg = colors.fg0, bg = "#3a3530", style = "bold" })
	hi("Added", { fg = colors.mint })
	hi("Changed", { fg = colors.yellow })
	hi("Removed", { fg = colors.coral })

	-- Spelling
	hi("SpellBad", { sp = colors.coral, style = "undercurl" })
	hi("SpellCap", { sp = colors.yellow, style = "undercurl" })
	hi("SpellLocal", { sp = colors.cyan, style = "undercurl" })
	hi("SpellRare", { sp = colors.violet, style = "undercurl" })

	-- Misc UI
	hi("Directory", { fg = colors.purple })
	hi("EndOfBuffer", { fg = colors.bg2 })
	hi("MatchParen", { fg = colors.yellow, bg = colors.bg3, style = "bold" })
	hi("NonText", { fg = colors.bg4 })
	hi("SpecialKey", { fg = colors.bg4 })
	hi("Whitespace", { fg = colors.bg3 })
	hi("WildMenu", { fg = colors.bg0, bg = colors.purple })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Syntax Highlighting
	-- ══════════════════════════════════════════════════════════════════════════
	hi("Comment", { fg = colors.fg2, style = "italic" })

	hi("Constant", { fg = colors.peach })
	hi("String", { fg = colors.sage })
	hi("Character", { fg = colors.sage })
	hi("Number", { fg = colors.peach })
	hi("Boolean", { fg = colors.mint })
	hi("Float", { fg = colors.peach })

	hi("Identifier", { fg = colors.fg0 })
	hi("Function", { fg = colors.purple })

	hi("Statement", { fg = colors.pink })
	hi("Conditional", { fg = colors.magenta })
	hi("Repeat", { fg = colors.magenta })
	hi("Label", { fg = colors.pink })
	hi("Operator", { fg = colors.pink })
	hi("Keyword", { fg = colors.pink })
	hi("Exception", { fg = colors.coral })

	hi("PreProc", { fg = colors.rose })
	hi("Include", { fg = colors.rose })
	hi("Define", { fg = colors.rose })
	hi("Macro", { fg = colors.rose })
	hi("PreCondit", { fg = colors.rose })

	hi("Type", { fg = colors.cyan })
	hi("StorageClass", { fg = colors.cyan })
	hi("Structure", { fg = colors.cyan })
	hi("Typedef", { fg = colors.cyan })

	hi("Special", { fg = colors.violet })
	hi("SpecialChar", { fg = colors.violet })
	hi("Tag", { fg = colors.pink })
	hi("Delimiter", { fg = colors.fg1 })
	hi("SpecialComment", { fg = colors.fg2, style = "bold" })
	hi("Debug", { fg = colors.coral })

	hi("Underlined", { fg = colors.purple, style = "underline" })
	hi("Ignore", { fg = colors.fg3 })
	hi("Error", { fg = colors.coral, style = "bold" })
	hi("Todo", { fg = colors.bg0, bg = colors.yellow, style = "bold" })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Treesitter Highlights
	-- ══════════════════════════════════════════════════════════════════════════
	hi("@variable", { fg = colors.fg0 })
	hi("@variable.builtin", { fg = colors.sky })
	hi("@variable.parameter", { fg = colors.sky, style = "italic" })
	hi("@variable.member", { fg = colors.fg0 })
	hi("@variable.member.ruby", { fg = colors.peach })

	hi("@constant", { fg = colors.peach })
	hi("@constant.builtin", { fg = colors.peach, style = "bold" })
	hi("@constant.macro", { fg = colors.peach })

	hi("@module", { fg = colors.cyan })
	hi("@label", { fg = colors.pink })

	hi("@string", { fg = colors.sage })
	hi("@string.documentation", { fg = colors.sage, style = "italic" })
	hi("@string.regexp", { fg = colors.rose })
	hi("@string.escape", { fg = colors.rose })
	hi("@string.special", { fg = colors.yellow })

	hi("@character", { fg = colors.sage })
	hi("@character.special", { fg = colors.violet })

	hi("@boolean", { fg = colors.mint })
	hi("@number", { fg = colors.peach })
	hi("@number.float", { fg = colors.peach })

	hi("@type", { fg = colors.cyan })
	hi("@type.builtin", { fg = colors.cyan, style = "italic" })
	hi("@type.definition", { fg = colors.cyan })

	hi("@attribute", { fg = colors.violet })
	hi("@property", { fg = colors.violet })

	hi("@function", { fg = colors.purple })
	hi("@function.builtin", { fg = colors.purple, style = "italic" })
	hi("@function.call", { fg = colors.purple })
	hi("@function.method", { fg = colors.purple })
	hi("@function.method.call", { fg = colors.purple })
	hi("@function.macro", { fg = colors.rose })

	hi("@constructor", { fg = colors.cyan })

	hi("@operator", { fg = colors.pink })

	hi("@keyword", { fg = colors.pink })
	hi("@keyword.coroutine", { fg = colors.magenta })
	hi("@keyword.function", { fg = colors.pink })
	hi("@keyword.operator", { fg = colors.pink })
	hi("@keyword.import", { fg = colors.rose })
	hi("@keyword.storage", { fg = colors.pink })
	hi("@keyword.repeat", { fg = colors.magenta })
	hi("@keyword.return", { fg = colors.magenta })
	hi("@keyword.debug", { fg = colors.coral })
	hi("@keyword.exception", { fg = colors.coral })
	hi("@keyword.conditional", { fg = colors.magenta })
	hi("@keyword.conditional.ternary", { fg = colors.magenta })
	hi("@keyword.directive", { fg = colors.rose })
	hi("@keyword.directive.define", { fg = colors.rose })

	hi("@punctuation.delimiter", { fg = colors.fg1 })
	hi("@punctuation.bracket", { fg = colors.fg1 })
	hi("@punctuation.special", { fg = colors.violet })

	hi("@comment", { fg = colors.fg2, style = "italic" })
	hi("@comment.documentation", { fg = colors.fg2, style = "italic" })
	hi("@comment.error", { fg = colors.coral, style = "bold" })
	hi("@comment.warning", { fg = colors.yellow, style = "bold" })
	hi("@comment.todo", { fg = colors.bg0, bg = colors.yellow, style = "bold" })
	hi("@comment.note", { fg = colors.bg0, bg = colors.purple, style = "bold" })

	hi("@markup.strong", { style = "bold" })
	hi("@markup.italic", { style = "italic" })
	hi("@markup.strikethrough", { style = "strikethrough" })
	hi("@markup.underline", { style = "underline" })
	hi("@markup.heading", { fg = colors.purple, style = "bold" })
	hi("@markup.quote", { fg = colors.fg1, style = "italic" })
	hi("@markup.math", { fg = colors.violet })
	hi("@markup.link", { fg = colors.purple, style = "underline" })
	hi("@markup.link.label", { fg = colors.sage })
	hi("@markup.link.url", { fg = colors.purple, style = "underline" })
	hi("@markup.raw", { fg = colors.sage })
	hi("@markup.raw.block", { fg = colors.fg0 })
	hi("@markup.list", { fg = colors.pink })
	hi("@markup.list.checked", { fg = colors.mint })
	hi("@markup.list.unchecked", { fg = colors.fg2 })

	hi("@diff.plus", { fg = colors.mint })
	hi("@diff.minus", { fg = colors.coral })
	hi("@diff.delta", { fg = colors.yellow })

	hi("@tag", { fg = colors.pink })
	hi("@tag.attribute", { fg = colors.violet })
	hi("@tag.delimiter", { fg = colors.fg1 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- LSP Semantic Tokens
	-- ══════════════════════════════════════════════════════════════════════════
	hi("@lsp.type.class", { fg = colors.cyan })
	hi("@lsp.type.decorator", { fg = colors.violet })
	hi("@lsp.type.enum", { fg = colors.cyan })
	hi("@lsp.type.enumMember", { fg = colors.peach })
	hi("@lsp.type.function", { fg = colors.purple })
	hi("@lsp.type.interface", { fg = colors.cyan })
	hi("@lsp.type.macro", { fg = colors.rose })
	hi("@lsp.type.method", { fg = colors.purple })
	hi("@lsp.type.namespace", { fg = colors.cyan })
	hi("@lsp.type.parameter", { fg = colors.sky, style = "italic" })
	hi("@lsp.type.property", { fg = colors.violet })
	hi("@lsp.type.struct", { fg = colors.cyan })
	hi("@lsp.type.type", { fg = colors.cyan })
	hi("@lsp.type.typeParameter", { fg = colors.teal, style = "italic" })
	hi("@lsp.type.variable", { fg = colors.fg0 })
	hi("@lsp.mod.deprecated", { style = "strikethrough" })
	hi("@lsp.mod.readonly", { style = "italic" })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Diagnostics
	-- ══════════════════════════════════════════════════════════════════════════
	hi("DiagnosticError", { fg = colors.coral })
	hi("DiagnosticWarn", { fg = colors.yellow })
	hi("DiagnosticInfo", { fg = colors.sky })
	hi("DiagnosticHint", { fg = colors.purple })
	hi("DiagnosticOk", { fg = colors.mint })

	hi("DiagnosticVirtualTextError", { fg = colors.coral, bg = "#2a2028" })
	hi("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = "#2a2825" })
	hi("DiagnosticVirtualTextInfo", { fg = colors.sky, bg = "#1f2530" })
	hi("DiagnosticVirtualTextHint", { fg = colors.purple, bg = "#252030" })
	hi("DiagnosticVirtualTextOk", { fg = colors.mint, bg = "#202a25" })

	hi("DiagnosticUnderlineError", { sp = colors.coral, style = "undercurl" })
	hi("DiagnosticUnderlineWarn", { sp = colors.yellow, style = "undercurl" })
	hi("DiagnosticUnderlineInfo", { sp = colors.sky, style = "undercurl" })
	hi("DiagnosticUnderlineHint", { sp = colors.purple, style = "undercurl" })
	hi("DiagnosticUnderlineOk", { sp = colors.mint, style = "undercurl" })

	hi("DiagnosticFloatingError", { fg = colors.coral })
	hi("DiagnosticFloatingWarn", { fg = colors.yellow })
	hi("DiagnosticFloatingInfo", { fg = colors.sky })
	hi("DiagnosticFloatingHint", { fg = colors.purple })
	hi("DiagnosticFloatingOk", { fg = colors.mint })

	hi("DiagnosticSignError", { fg = colors.coral })
	hi("DiagnosticSignWarn", { fg = colors.yellow })
	hi("DiagnosticSignInfo", { fg = colors.sky })
	hi("DiagnosticSignHint", { fg = colors.purple })
	hi("DiagnosticSignOk", { fg = colors.mint })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Git Signs
	-- ══════════════════════════════════════════════════════════════════════════
	hi("GitSignsAdd", { fg = colors.mint })
	hi("GitSignsChange", { fg = colors.yellow })
	hi("GitSignsDelete", { fg = colors.coral })
	hi("GitSignsCurrentLineBlame", { fg = colors.fg3, style = "italic" })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Telescope
	-- ══════════════════════════════════════════════════════════════════════════
	hi("TelescopeBorder", { fg = colors.bg4, bg = colors.bg1 })
	hi("TelescopeNormal", { fg = colors.fg0, bg = colors.bg1 })
	hi("TelescopePreviewTitle", { fg = colors.bg0, bg = colors.purple, style = "bold" })
	hi("TelescopePromptTitle", { fg = colors.bg0, bg = colors.pink, style = "bold" })
	hi("TelescopeResultsTitle", { fg = colors.bg0, bg = colors.violet, style = "bold" })
	hi("TelescopeSelection", { fg = colors.fg0, bg = colors.bg3 })
	hi("TelescopeSelectionCaret", { fg = colors.purple, bg = colors.bg3 })
	hi("TelescopeMatching", { fg = colors.purple, style = "bold" })
	hi("TelescopePromptPrefix", { fg = colors.purple })

	-- ══════════════════════════════════════════════════════════════════════════
	-- NvimTree / Neo-tree
	-- ══════════════════════════════════════════════════════════════════════════
	hi("NvimTreeNormal", { fg = colors.fg0, bg = bg_sidebar })
	hi("NvimTreeFolderIcon", { fg = colors.purple })
	hi("NvimTreeFolderName", { fg = colors.purple })
	hi("NvimTreeOpenedFolderName", { fg = colors.purple, style = "bold" })
	hi("NvimTreeRootFolder", { fg = colors.violet, style = "bold" })
	hi("NvimTreeGitDirty", { fg = colors.yellow })
	hi("NvimTreeGitNew", { fg = colors.mint })
	hi("NvimTreeGitDeleted", { fg = colors.coral })
	hi("NvimTreeSpecialFile", { fg = colors.rose })
	hi("NvimTreeIndentMarker", { fg = colors.bg4 })

	hi("NeoTreeNormal", { fg = colors.fg0, bg = bg_sidebar })
	hi("NeoTreeNormalNC", { fg = colors.fg1, bg = bg_sidebar })
	hi("NeoTreeDirectoryIcon", { fg = colors.purple })
	hi("NeoTreeDirectoryName", { fg = colors.purple })
	hi("NeoTreeRootName", { fg = colors.violet, style = "bold" })
	hi("NeoTreeGitAdded", { fg = colors.mint })
	hi("NeoTreeGitModified", { fg = colors.yellow })
	hi("NeoTreeGitDeleted", { fg = colors.coral })
	hi("NeoTreeGitConflict", { fg = colors.coral, style = "bold" })
	hi("NeoTreeGitUntracked", { fg = colors.peach })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Indent Blankline
	-- ══════════════════════════════════════════════════════════════════════════
	hi("IndentBlanklineChar", { fg = colors.bg3 })
	hi("IndentBlanklineContextChar", { fg = colors.bg4 })
	hi("IblIndent", { fg = colors.bg3 })
	hi("IblScope", { fg = colors.bg4 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Which-key
	-- ══════════════════════════════════════════════════════════════════════════
	hi("WhichKey", { fg = colors.purple })
	hi("WhichKeyGroup", { fg = colors.pink })
	hi("WhichKeyDesc", { fg = colors.fg0 })
	hi("WhichKeySeparator", { fg = colors.fg3 })
	hi("WhichKeyFloat", { bg = colors.bg1 })
	hi("WhichKeyBorder", { fg = colors.bg4, bg = colors.bg1 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Lazy.nvim
	-- ══════════════════════════════════════════════════════════════════════════
	hi("LazyH1", { fg = colors.bg0, bg = colors.purple, style = "bold" })
	hi("LazyButton", { fg = colors.fg0, bg = colors.bg2 })
	hi("LazyButtonActive", { fg = colors.bg0, bg = colors.purple, style = "bold" })
	hi("LazySpecial", { fg = colors.purple })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Mason
	-- ══════════════════════════════════════════════════════════════════════════
	hi("MasonHeader", { fg = colors.bg0, bg = colors.purple, style = "bold" })
	hi("MasonHighlight", { fg = colors.purple })
	hi("MasonHighlightBlock", { fg = colors.bg0, bg = colors.purple })
	hi("MasonHighlightBlockBold", { fg = colors.bg0, bg = colors.purple, style = "bold" })
	hi("MasonMuted", { fg = colors.fg2 })
	hi("MasonMutedBlock", { fg = colors.bg0, bg = colors.fg2 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Notify
	-- ══════════════════════════════════════════════════════════════════════════
	hi("NotifyERRORBorder", { fg = colors.coral })
	hi("NotifyWARNBorder", { fg = colors.yellow })
	hi("NotifyINFOBorder", { fg = colors.sky })
	hi("NotifyDEBUGBorder", { fg = colors.fg2 })
	hi("NotifyTRACEBorder", { fg = colors.violet })
	hi("NotifyERRORIcon", { fg = colors.coral })
	hi("NotifyWARNIcon", { fg = colors.yellow })
	hi("NotifyINFOIcon", { fg = colors.sky })
	hi("NotifyDEBUGIcon", { fg = colors.fg2 })
	hi("NotifyTRACEIcon", { fg = colors.violet })
	hi("NotifyERRORTitle", { fg = colors.coral, style = "bold" })
	hi("NotifyWARNTitle", { fg = colors.yellow, style = "bold" })
	hi("NotifyINFOTitle", { fg = colors.sky, style = "bold" })
	hi("NotifyDEBUGTitle", { fg = colors.fg2, style = "bold" })
	hi("NotifyTRACETitle", { fg = colors.violet, style = "bold" })
	hi("NotifyERRORBody", { fg = colors.fg0 })
	hi("NotifyWARNBody", { fg = colors.fg0 })
	hi("NotifyINFOBody", { fg = colors.fg0 })
	hi("NotifyDEBUGBody", { fg = colors.fg0 })
	hi("NotifyTRACEBody", { fg = colors.fg0 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Cmp (completion)
	-- ══════════════════════════════════════════════════════════════════════════
	hi("CmpItemAbbr", { fg = colors.fg0 })
	hi("CmpItemAbbrDeprecated", { fg = colors.fg2, style = "strikethrough" })
	hi("CmpItemAbbrMatch", { fg = colors.purple, style = "bold" })
	hi("CmpItemAbbrMatchFuzzy", { fg = colors.purple })
	hi("CmpItemKind", { fg = colors.violet })
	hi("CmpItemMenu", { fg = colors.fg2 })
	hi("CmpItemKindClass", { fg = colors.cyan })
	hi("CmpItemKindColor", { fg = colors.rose })
	hi("CmpItemKindConstant", { fg = colors.peach })
	hi("CmpItemKindConstructor", { fg = colors.cyan })
	hi("CmpItemKindEnum", { fg = colors.cyan })
	hi("CmpItemKindEnumMember", { fg = colors.peach })
	hi("CmpItemKindEvent", { fg = colors.violet })
	hi("CmpItemKindField", { fg = colors.fg0 })
	hi("CmpItemKindFile", { fg = colors.purple })
	hi("CmpItemKindFolder", { fg = colors.purple })
	hi("CmpItemKindFunction", { fg = colors.purple })
	hi("CmpItemKindInterface", { fg = colors.cyan })
	hi("CmpItemKindKeyword", { fg = colors.pink })
	hi("CmpItemKindMethod", { fg = colors.purple })
	hi("CmpItemKindModule", { fg = colors.cyan })
	hi("CmpItemKindOperator", { fg = colors.pink })
	hi("CmpItemKindProperty", { fg = colors.violet })
	hi("CmpItemKindReference", { fg = colors.violet })
	hi("CmpItemKindSnippet", { fg = colors.sage })
	hi("CmpItemKindStruct", { fg = colors.cyan })
	hi("CmpItemKindText", { fg = colors.fg1 })
	hi("CmpItemKindTypeParameter", { fg = colors.teal })
	hi("CmpItemKindUnit", { fg = colors.peach })
	hi("CmpItemKindValue", { fg = colors.peach })
	hi("CmpItemKindVariable", { fg = colors.sky })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Noice
	-- ══════════════════════════════════════════════════════════════════════════
	hi("NoiceCmdline", { fg = colors.fg0, bg = colors.bg1 })
	hi("NoiceCmdlineIcon", { fg = colors.purple })
	hi("NoiceCmdlineIconSearch", { fg = colors.yellow })
	hi("NoiceCmdlinePopup", { fg = colors.fg0, bg = colors.bg1 })
	hi("NoiceCmdlinePopupBorder", { fg = colors.bg4, bg = colors.bg1 })
	hi("NoiceCmdlinePrompt", { fg = colors.purple })
	hi("NoiceConfirm", { fg = colors.fg0, bg = colors.bg1 })
	hi("NoiceConfirmBorder", { fg = colors.bg4, bg = colors.bg1 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Dashboard / Alpha
	-- ══════════════════════════════════════════════════════════════════════════
	hi("DashboardHeader", { fg = colors.purple })
	hi("DashboardFooter", { fg = colors.fg2, style = "italic" })
	hi("DashboardCenter", { fg = colors.pink })
	hi("DashboardShortcut", { fg = colors.violet })
	hi("DashboardIcon", { fg = colors.purple })
	hi("DashboardDesc", { fg = colors.fg0 })
	hi("DashboardKey", { fg = colors.yellow })

	hi("AlphaHeader", { fg = colors.purple })
	hi("AlphaButtons", { fg = colors.pink })
	hi("AlphaShortcut", { fg = colors.violet })
	hi("AlphaFooter", { fg = colors.fg2, style = "italic" })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Bufferline
	-- ══════════════════════════════════════════════════════════════════════════
	hi("BufferLineFill", { bg = bg_main })
	hi("BufferLineBackground", { fg = colors.fg2, bg = colors.bg1 })
	hi("BufferLineBuffer", { fg = colors.fg2, bg = colors.bg1 })
	hi("BufferLineBufferSelected", { fg = colors.fg0, bg = colors.bg0, style = "bold" })
	hi("BufferLineBufferVisible", { fg = colors.fg1, bg = colors.bg0 })
	hi("BufferLineCloseButton", { fg = colors.fg2, bg = colors.bg1 })
	hi("BufferLineCloseButtonSelected", { fg = colors.coral, bg = colors.bg0 })
	hi("BufferLineCloseButtonVisible", { fg = colors.fg1, bg = colors.bg0 })
	hi("BufferLineIndicatorSelected", { fg = colors.purple, bg = colors.bg0 })
	hi("BufferLineModified", { fg = colors.yellow, bg = colors.bg1 })
	hi("BufferLineModifiedSelected", { fg = colors.yellow, bg = colors.bg0 })
	hi("BufferLineModifiedVisible", { fg = colors.yellow, bg = colors.bg0 })
	hi("BufferLineSeparator", { fg = colors.bg0, bg = colors.bg1 })
	hi("BufferLineSeparatorSelected", { fg = colors.bg0, bg = colors.bg0 })
	hi("BufferLineSeparatorVisible", { fg = colors.bg0, bg = colors.bg0 })

	-- ══════════════════════════════════════════════════════════════════════════
	-- Terminal Colors
	-- ══════════════════════════════════════════════════════════════════════════
	if config.terminal_colors then
		vim.g.terminal_color_0 = colors.bg1 -- Black
		vim.g.terminal_color_1 = colors.coral -- Red
		vim.g.terminal_color_2 = colors.mint -- Green
		vim.g.terminal_color_3 = colors.yellow -- Yellow
		vim.g.terminal_color_4 = colors.purple -- Blue (using purple as primary)
		vim.g.terminal_color_5 = colors.pink -- Magenta
		vim.g.terminal_color_6 = colors.cyan -- Cyan
		vim.g.terminal_color_7 = colors.fg1 -- White
		vim.g.terminal_color_8 = colors.bg3 -- Bright Black
		vim.g.terminal_color_9 = "#f0a0a8" -- Bright Red
		vim.g.terminal_color_10 = "#a0f0b8" -- Bright Green
		vim.g.terminal_color_11 = "#f0e0a0" -- Bright Yellow
		vim.g.terminal_color_12 = colors.violet -- Bright Blue (violet)
		vim.g.terminal_color_13 = colors.rose -- Bright Magenta
		vim.g.terminal_color_14 = colors.teal -- Bright Cyan
		vim.g.terminal_color_15 = colors.fg0 -- Bright White
	end

	-- Store lualine theme in global for backwards compatibility
	vim.g.aurora_depths_lualine = M.lualine()
end

-- ══════════════════════════════════════════════════════════════════════════════
-- Lualine theme integration
-- Usage: require('lualine').setup { options = { theme = require('aurora-depths').lualine() } }
-- ══════════════════════════════════════════════════════════════════════════════
function M.lualine()
	return {
		normal = {
			a = { fg = colors.bg0, bg = colors.purple, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		insert = {
			a = { fg = colors.bg0, bg = colors.mint, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		visual = {
			a = { fg = colors.bg0, bg = colors.violet, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		replace = {
			a = { fg = colors.bg0, bg = colors.coral, gui = "bold" },
			b = { fg = colors.fg0, bg = colors.bg2 },
			c = { fg = colors.fg1, bg = colors.bg1 },
		},
		command = {
			a = { fg = colors.bg0, bg = colors.pink, gui = "bold" },
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

-- ══════════════════════════════════════════════════════════════════════════════
-- Bufferline theme integration
-- Usage: require('bufferline').setup { highlights = require('aurora-depths').bufferline() }
-- ══════════════════════════════════════════════════════════════════════════════
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
		indicator_selected = { fg = colors.purple, bg = colors.bg0 },
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
		numbers_selected = { fg = colors.purple, bg = colors.bg0, bold = true },
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
		info = { fg = colors.sky, bg = colors.bg1 },
		info_visible = { fg = colors.sky, bg = colors.bg0 },
		info_selected = { fg = colors.sky, bg = colors.bg0, bold = true },
		info_diagnostic = { fg = colors.sky, bg = colors.bg1 },
		info_diagnostic_visible = { fg = colors.sky, bg = colors.bg0 },
		info_diagnostic_selected = { fg = colors.sky, bg = colors.bg0, bold = true },
		hint = { fg = colors.purple, bg = colors.bg1 },
		hint_visible = { fg = colors.purple, bg = colors.bg0 },
		hint_selected = { fg = colors.purple, bg = colors.bg0, bold = true },
		hint_diagnostic = { fg = colors.purple, bg = colors.bg1 },
		hint_diagnostic_visible = { fg = colors.purple, bg = colors.bg0 },
		hint_diagnostic_selected = { fg = colors.purple, bg = colors.bg0, bold = true },
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
