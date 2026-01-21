#!/usr/bin/env bash
#
# Aurora Depths Purple Edition - Zsh Installation Script
# Installs the zsh-syntax-highlighting theme
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$(dirname "$SCRIPT_DIR")"
ZSH_THEME_SOURCE="$THEME_DIR/zsh/aurora-depths.zsh"
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

# Colors for output (using Aurora Depths palette!)
PURPLE='\033[38;2;196;181;240m'
PINK='\033[38;2;240;160;200m'
MINT='\033[38;2;140;224;160m'
YELLOW='\033[38;2;232;208;136m'
CORAL='\033[38;2;232;128;144m'
NC='\033[0m' # No Color

info() { echo -e "${PURPLE}[INFO]${NC} $1"; }
success() { echo -e "${MINT}[SUCCESS]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${CORAL}[ERROR]${NC} $1"; exit 1; }

echo ""
echo -e "  ${PURPLE}Aurora Depths Purple Edition${NC} - Zsh Installer"
echo "  =============================================="
echo ""

# Check if zsh theme file exists
if [[ ! -f "$ZSH_THEME_SOURCE" ]]; then
    error "Theme file not found: $ZSH_THEME_SOURCE"
fi

# Check if .zshrc exists
if [[ ! -f "$ZSHRC" ]]; then
    warn ".zshrc not found at $ZSHRC"
    echo ""
    read -p "  Create new .zshrc? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        touch "$ZSHRC"
        success "Created $ZSHRC"
    else
        error "Cannot proceed without .zshrc"
    fi
fi

# Check for zsh-syntax-highlighting
info "Checking for zsh-syntax-highlighting..."

ZSH_SH_INSTALLED=false

# Check common installation locations
ZSH_SH_PATHS=(
    "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
)

for path in "${ZSH_SH_PATHS[@]}"; do
    if [[ -f "$path" ]]; then
        ZSH_SH_INSTALLED=true
        ZSH_SH_PATH="$path"
        break
    fi
done

# Also check if it's referenced in .zshrc
if grep -q "zsh-syntax-highlighting" "$ZSHRC" 2>/dev/null; then
    ZSH_SH_INSTALLED=true
fi

if [[ "$ZSH_SH_INSTALLED" == false ]]; then
    warn "zsh-syntax-highlighting not detected"
    echo ""
    echo "  This theme requires zsh-syntax-highlighting to be installed."
    echo ""
    echo "  Install it using one of these methods:"
    echo ""
    echo "    # Homebrew (macOS)"
    echo "    brew install zsh-syntax-highlighting"
    echo ""
    echo "    # apt (Debian/Ubuntu)"
    echo "    sudo apt install zsh-syntax-highlighting"
    echo ""
    echo "    # Oh My Zsh"
    echo "    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \\"
    echo "      \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    echo ""
    read -p "  Continue anyway? [y/N] " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    success "zsh-syntax-highlighting detected"
fi

# Check if theme is already sourced in .zshrc
SOURCE_LINE="source \"$ZSH_THEME_SOURCE\""
SOURCE_LINE_SHORT="source .*/aurora-depths.*\.zsh"

if grep -qE "$SOURCE_LINE_SHORT" "$ZSHRC" 2>/dev/null; then
    info "Aurora Depths theme already configured in .zshrc"
    echo ""
    echo "  Existing configuration found:"
    grep -E "$SOURCE_LINE_SHORT" "$ZSHRC" | head -1 | sed 's/^/    /'
    echo ""
    read -p "  Update to new path? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Remove old line and add new one
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "/$SOURCE_LINE_SHORT/d" "$ZSHRC"
        else
            sed -i "/$SOURCE_LINE_SHORT/d" "$ZSHRC"
        fi
        info "Removed old configuration"
    else
        success "Keeping existing configuration"
        echo ""
        exit 0
    fi
fi

# Add source line to .zshrc
info "Adding Aurora Depths theme to .zshrc..."

# Add a blank line if the file doesn't end with one
[[ -s "$ZSHRC" && $(tail -c1 "$ZSHRC" | wc -l) -eq 0 ]] && echo "" >> "$ZSHRC"

cat >> "$ZSHRC" << EOF

# ──────────────────────────────────────────────────────────────────────────────
# Aurora Depths Purple Edition - Zsh Syntax Highlighting Theme
# ──────────────────────────────────────────────────────────────────────────────
# NOTE: This must be sourced AFTER zsh-syntax-highlighting
$SOURCE_LINE
EOF

success "Theme configuration added to .zshrc"

echo ""
success "Zsh installation complete!"
echo ""
echo "  Theme source:  $ZSH_THEME_SOURCE"
echo "  Config file:   $ZSHRC"
echo ""
echo -e "  ${YELLOW}Important:${NC} Make sure zsh-syntax-highlighting is sourced"
echo "  BEFORE the Aurora Depths theme in your .zshrc"
echo ""
echo "  Example .zshrc order:"
echo ""
echo "    # 1. Source zsh-syntax-highlighting first"
echo "    source /path/to/zsh-syntax-highlighting.zsh"
echo ""
echo "    # 2. Then source Aurora Depths theme"
echo "    $SOURCE_LINE"
echo ""
echo "  Restart your shell or run: source ~/.zshrc"
echo ""
