# ══════════════════════════════════════════════════════════════════════════════
# Aurora Depths - Purple Edition - Zsh Syntax Highlighting
# Sophisticated purple-first palette with WCAG AA compliance
# ══════════════════════════════════════════════════════════════════════════════
#
# Installation:
#   1. Make sure zsh-syntax-highlighting is installed
#   2. Source this file AFTER sourcing zsh-syntax-highlighting in your .zshrc:
#
#      source /path/to/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#      source /path/to/aurora-depths-theme/zsh/aurora-depths.zsh
#
# Color Palette Reference (Purple Edition):
# ──────────────────────────────────────────────────────────────────────────────
#   purple:  #c4b5f0  (Functions, commands - primary accent)
#   violet:  #a78bfa  (Decorators, properties)
#   pink:    #f0a0c8  (Keywords, reserved words)
#   magenta: #e879a8  (Control flow)
#   cyan:    #7dd3d0  (Types, options)
#   teal:    #5ccfb8  (Type parameters)
#   sage:    #a8d4a8  (Strings)
#   mint:    #8ce0a0  (Success, paths)
#   yellow:  #e8d088  (Warnings, globbing)
#   peach:   #e8a888  (Numbers, constants)
#   coral:   #e88090  (Errors)
#   sky:     #88c4f0  (Variables)
#   rose:    #e0a8c0  (Imports, here-docs)
#   fg0:     #e8e6f0  (Primary text)
#   fg1:     #c4c0d4  (Secondary text)
#   fg2:     #908ca4  (Muted text)
#   fg3:     #686480  (Disabled text)
#   bg3:     #3a3550  (Selections)
# ══════════════════════════════════════════════════════════════════════════════

# Check if ZSH_HIGHLIGHT_STYLES is available (zsh-syntax-highlighting loaded)
if (( ${+ZSH_HIGHLIGHT_STYLES} )); then

    # ══════════════════════════════════════════════════════════════════════════
    # Commands & Executables
    # ══════════════════════════════════════════════════════════════════════════

    # Valid commands - PURPLE (the hero color!)
    ZSH_HIGHLIGHT_STYLES[command]='fg=#c4b5f0'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=#c4b5f0'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=#c4b5f0'
    ZSH_HIGHLIGHT_STYLES[function]='fg=#c4b5f0'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=#c4b5f0,underline'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#c4b5f0'

    # Command substitution
    ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#a78bfa'
    ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=#a78bfa'
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#f0a0c8'
    ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#f0a0c8'

    # ══════════════════════════════════════════════════════════════════════════
    # Arguments & Options
    # ══════════════════════════════════════════════════════════════════════════

    # Arguments and options - Cyan (complementary to purple)
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#7dd3d0'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#7dd3d0'

    # ══════════════════════════════════════════════════════════════════════════
    # Paths & Files
    # ══════════════════════════════════════════════════════════════════════════

    # Valid paths - Mint (success)
    ZSH_HIGHLIGHT_STYLES[path]='fg=#8ce0a0,underline'
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#8ce0a0'
    ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#8ce0a0,underline'
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#8ce0a0'
    ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#8ce0a0,underline'

    # ══════════════════════════════════════════════════════════════════════════
    # Strings & Quotes
    # ══════════════════════════════════════════════════════════════════════════

    # Strings - Sage
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#a8d4a8'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#a8d4a8'
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#a8d4a8'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#a8d4a8'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#e88090'
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#e88090'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#e88090'
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#e88090'

    # Here documents - Rose
    ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#e0a8c0'

    # ══════════════════════════════════════════════════════════════════════════
    # Variables & Parameters
    # ══════════════════════════════════════════════════════════════════════════

    # Variables - Sky
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#88c4f0'
    ZSH_HIGHLIGHT_STYLES[assign]='fg=#88c4f0'
    ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#88c4f0'
    ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#88c4f0'

    # ══════════════════════════════════════════════════════════════════════════
    # Reserved Words & Keywords
    # ══════════════════════════════════════════════════════════════════════════

    # Reserved words (if, then, else, fi, for, while, etc.) - Pink
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#f0a0c8'

    # ══════════════════════════════════════════════════════════════════════════
    # Globbing & Patterns
    # ══════════════════════════════════════════════════════════════════════════

    # Globbing - Yellow
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e8d088'
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#e8d088'

    # ══════════════════════════════════════════════════════════════════════════
    # Operators & Separators
    # ══════════════════════════════════════════════════════════════════════════

    # Operators and redirections - Pink
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f0a0c8'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=#f0a0c8'
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=#c4b5f0'

    # ══════════════════════════════════════════════════════════════════════════
    # Comments
    # ══════════════════════════════════════════════════════════════════════════

    # Comments - Muted text
    ZSH_HIGHLIGHT_STYLES[comment]='fg=#908ca4,italic'

    # ══════════════════════════════════════════════════════════════════════════
    # Errors & Unknown
    # ══════════════════════════════════════════════════════════════════════════

    # Unknown/invalid - Coral (errors)
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#e88090'

    # ══════════════════════════════════════════════════════════════════════════
    # Default & Misc
    # ══════════════════════════════════════════════════════════════════════════

    # Default text
    ZSH_HIGHLIGHT_STYLES[default]='fg=#e8e6f0'

    # Suffix aliases
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#c4b5f0,underline'
    ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#c4b5f0'

fi

# ══════════════════════════════════════════════════════════════════════════════
# Zsh Autosuggestions (if installed)
# ══════════════════════════════════════════════════════════════════════════════

if (( ${+ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE} )) || [[ -n "$ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE" ]] || true; then
    # Autosuggestions - Muted (fg3)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#686480'
fi

# ══════════════════════════════════════════════════════════════════════════════
# LS_COLORS / EZA_COLORS (directory listing colors)
# ══════════════════════════════════════════════════════════════════════════════

# Export LS_COLORS with Aurora Depths palette
export LS_COLORS="di=38;2;196;181;240:ln=38;2;167;139;250:so=38;2;125;211;208:pi=38;2;232;208;136:ex=38;2;140;224;160:bd=38;2;232;168;136:cd=38;2;232;168;136:su=38;2;232;128;144:sg=38;2;232;128;144:tw=38;2;196;181;240:ow=38;2;196;181;240:*.tar=38;2;232;168;136:*.zip=38;2;232;168;136:*.gz=38;2;232;168;136:*.bz2=38;2;232;168;136:*.xz=38;2;232;168;136:*.7z=38;2;232;168;136:*.rar=38;2;232;168;136"

# EZA colors (modern ls replacement)
export EZA_COLORS="di=38;2;196;181;240:ln=38;2;167;139;250:so=38;2;125;211;208:pi=38;2;232;208;136:ex=38;2;140;224;160:bd=38;2;232;168;136:cd=38;2;232;168;136:ur=38;2;168;212;168:uw=38;2;232;208;136:ux=38;2;232;128;144:ue=38;2;232;128;144:gr=38;2;168;212;168:gw=38;2;232;208;136:gx=38;2;232;128;144:tr=38;2;168;212;168:tw=38;2;232;208;136:tx=38;2;232;128;144:sn=38;2;168;212;168:sb=38;2;232;168;136:da=38;2;144;140;164:uu=38;2;196;181;240:un=38;2;240;160;200:gu=38;2;240;160;200:gn=38;2;240;160;200"

echo "Aurora Depths Purple Edition loaded for zsh-syntax-highlighting"
