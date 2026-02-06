# ══════════════════════════════════════════════════════════════════════════════
# Tokyo Night - Zsh Syntax Highlighting
# Based on folke/tokyonight.nvim - Night variant
# A clean, dark theme with vibrant colors
# ══════════════════════════════════════════════════════════════════════════════
#
# Installation:
#   1. Make sure zsh-syntax-highlighting is installed
#   2. Source this file AFTER sourcing zsh-syntax-highlighting in your .zshrc:
#
#      source /path/to/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#      source /path/to/aurora-depths-theme/zsh/tokyonight.zsh
#
# Color Palette Reference (Tokyo Night):
# ──────────────────────────────────────────────────────────────────────────────
#   blue:    #7aa2f7  (Functions, commands - primary accent)
#   cyan:    #7dcfff  (Keywords, bright accent)
#   magenta: #bb9af7  (Types, classes)
#   purple:  #9d7cd8  (Keywords italic)
#   green:   #9ece6a  (Strings)
#   green1:  #73daca  (Properties)
#   orange:  #ff9e64  (Numbers, constants)
#   red:     #f7768e  (Errors)
#   yellow:  #e0af68  (Warnings, parameters)
#   fg:      #c0caf5  (Primary text)
#   fg_dark: #a9b1d6  (Secondary text)
#   comment: #565f89  (Muted text)
#   dark5:   #737aa2  (Disabled text)
# ══════════════════════════════════════════════════════════════════════════════

# Check if ZSH_HIGHLIGHT_STYLES is available (zsh-syntax-highlighting loaded)
if (( ${+ZSH_HIGHLIGHT_STYLES} )); then

    # ══════════════════════════════════════════════════════════════════════════
    # Commands & Executables
    # ══════════════════════════════════════════════════════════════════════════

    # Valid commands - BLUE (the hero color!)
    ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7aa2f7'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=#7aa2f7'
    ZSH_HIGHLIGHT_STYLES[function]='fg=#7aa2f7'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=#7aa2f7,underline'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#7aa2f7'

    # Command substitution
    ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#7dcfff'
    ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=#7dcfff'
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#2ac3de'
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#2ac3de'

    # ══════════════════════════════════════════════════════════════════════════
    # Arguments & Options
    # ══════════════════════════════════════════════════════════════════════════

    # Arguments and options - Cyan
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#7dcfff'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#7dcfff'

    # ══════════════════════════════════════════════════════════════════════════
    # Paths & Files
    # ══════════════════════════════════════════════════════════════════════════

    # Valid paths - Green1 (properties/teal)
    ZSH_HIGHLIGHT_STYLES[path]='fg=#73daca,underline'
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#73daca'
    ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#73daca,underline'
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#73daca'
    ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#73daca,underline'

    # ══════════════════════════════════════════════════════════════════════════
    # Strings & Quotes
    # ══════════════════════════════════════════════════════════════════════════

    # Strings - Green
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#9ece6a'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#9ece6a'
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#9ece6a'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#9ece6a'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#f7768e'
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#f7768e'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#f7768e'
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#f7768e'

    # Here documents - Magenta
    ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#bb9af7'

    # ══════════════════════════════════════════════════════════════════════════
    # Variables & Parameters
    # ══════════════════════════════════════════════════════════════════════════

    # Variables - Foreground/Yellow
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e0af68'
    ZSH_HIGHLIGHT_STYLES[assign]='fg=#c0caf5'
    ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#c0caf5'
    ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#c0caf5'

    # ══════════════════════════════════════════════════════════════════════════
    # Reserved Words & Keywords
    # ══════════════════════════════════════════════════════════════════════════

    # Reserved words (if, then, else, fi, for, while, etc.) - Purple
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#9d7cd8'

    # ══════════════════════════════════════════════════════════════════════════
    # Globbing & Patterns
    # ══════════════════════════════════════════════════════════════════════════

    # Globbing - Yellow
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e0af68'
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#e0af68'

    # ══════════════════════════════════════════════════════════════════════════
    # Operators & Separators
    # ══════════════════════════════════════════════════════════════════════════

    # Operators and redirections - Magenta
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#bb9af7'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=#89ddff'
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=#7aa2f7'

    # ══════════════════════════════════════════════════════════════════════════
    # Comments
    # ══════════════════════════════════════════════════════════════════════════

    # Comments - Muted text
    ZSH_HIGHLIGHT_STYLES[comment]='fg=#565f89,italic'

    # ══════════════════════════════════════════════════════════════════════════
    # Errors & Unknown
    # ══════════════════════════════════════════════════════════════════════════

    # Unknown/invalid - Red (errors)
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e'

    # ══════════════════════════════════════════════════════════════════════════
    # Default & Misc
    # ══════════════════════════════════════════════════════════════════════════

    # Default text
    ZSH_HIGHLIGHT_STYLES[default]='fg=#c0caf5'

    # Suffix aliases
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#7aa2f7,underline'
    ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#7aa2f7'

fi

# ══════════════════════════════════════════════════════════════════════════════
# Zsh Autosuggestions (if installed)
# ══════════════════════════════════════════════════════════════════════════════

if (( ${+ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE} )) || [[ -n "$ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE" ]] || true; then
    # Autosuggestions - Comment color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#565f89'
fi

# ══════════════════════════════════════════════════════════════════════════════
# LS_COLORS / EZA_COLORS (directory listing colors)
# ══════════════════════════════════════════════════════════════════════════════

# Export LS_COLORS with Tokyo Night palette
# di=directory, ln=symlink, so=socket, pi=pipe, ex=executable, bd/cd=block/char device
# su/sg=setuid/setgid, tw=sticky+other-writable, ow=other-writable
# Blue=#7aa2f7 (122,162,247), Cyan=#7dcfff (125,207,255), Green=#9ece6a (158,206,106)
# Green1=#73daca (115,218,202), Yellow=#e0af68 (224,175,104), Orange=#ff9e64 (255,158,100)
# Red=#f7768e (247,118,142), Magenta=#bb9af7 (187,154,247)
export LS_COLORS="di=38;2;122;162;247:ln=38;2;125;207;255:so=38;2;42;195;222:pi=38;2;224;175;104:ex=38;2;158;206;106:bd=38;2;255;158;100:cd=38;2;255;158;100:su=38;2;247;118;142:sg=38;2;247;118;142:tw=38;2;122;162;247:ow=38;2;122;162;247:*.tar=38;2;255;158;100:*.zip=38;2;255;158;100:*.gz=38;2;255;158;100:*.bz2=38;2;255;158;100:*.xz=38;2;255;158;100:*.7z=38;2;255;158;100:*.rar=38;2;255;158;100"

# EZA colors (modern ls replacement)
# ur/uw/ux=user read/write/execute, gr/gw/gx=group, tr/tw/tx=other
# sn=size number, sb=size unit, da=date, uu/un=user you/not you, gu/gn=group
export EZA_COLORS="di=38;2;122;162;247:ln=38;2;125;207;255:so=38;2;42;195;222:pi=38;2;224;175;104:ex=38;2;158;206;106:bd=38;2;255;158;100:cd=38;2;255;158;100:ur=38;2;158;206;106:uw=38;2;224;175;104:ux=38;2;247;118;142:ue=38;2;247;118;142:gr=38;2;158;206;106:gw=38;2;224;175;104:gx=38;2;247;118;142:tr=38;2;158;206;106:tw=38;2;224;175;104:tx=38;2;247;118;142:sn=38;2;115;218;202:sb=38;2;255;158;100:da=38;2;115;170;162:uu=38;2;122;162;247:un=38;2;187;154;247:gu=38;2;187;154;247:gn=38;2;187;154;247"

echo "Tokyo Night theme loaded for zsh-syntax-highlighting"
