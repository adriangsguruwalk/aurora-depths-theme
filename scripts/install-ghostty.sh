#!/usr/bin/env bash
#
# Aurora Depths 2026 - Ghostty Installation Script
# Installs the color theme and configures Ghostty to use it
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$(dirname "$SCRIPT_DIR")"
GHOSTTY_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
GHOSTTY_THEMES_DIR="$GHOSTTY_CONFIG_DIR/themes"
GHOSTTY_CONFIG="$GHOSTTY_CONFIG_DIR/config"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo ""
echo "  Aurora Depths 2026 - Ghostty Installer"
echo "  ======================================="
echo ""

# Check if Ghostty config directory exists
if [[ ! -d "$GHOSTTY_CONFIG_DIR" ]]; then
    info "Creating Ghostty config directory..."
    mkdir -p "$GHOSTTY_CONFIG_DIR"
fi

# Create themes directory if it doesn't exist
if [[ ! -d "$GHOSTTY_THEMES_DIR" ]]; then
    info "Creating Ghostty themes directory..."
    mkdir -p "$GHOSTTY_THEMES_DIR"
fi

# Symlink the theme file
THEME_SOURCE="$THEME_DIR/ghostty/config"
THEME_DEST="$GHOSTTY_THEMES_DIR/aurora-depths"

if [[ -L "$THEME_DEST" ]]; then
    info "Removing existing symlink..."
    rm "$THEME_DEST"
elif [[ -f "$THEME_DEST" ]]; then
    warn "Backing up existing theme file to ${THEME_DEST}.backup"
    mv "$THEME_DEST" "${THEME_DEST}.backup"
fi

info "Creating symlink: $THEME_DEST -> $THEME_SOURCE"
ln -s "$THEME_SOURCE" "$THEME_DEST"
success "Theme file symlinked successfully"

# Check if Ghostty config exists and add theme line
THEME_LINE="theme = aurora-depths"

if [[ -f "$GHOSTTY_CONFIG" ]]; then
    # Check if theme is already configured
    if grep -q "^theme = aurora-depths" "$GHOSTTY_CONFIG" 2>/dev/null; then
        info "Theme already configured in Ghostty config"
    elif grep -q "^theme = " "$GHOSTTY_CONFIG" 2>/dev/null; then
        warn "Another theme is configured in your Ghostty config"
        echo ""
        echo "  Current theme line:"
        grep "^theme = " "$GHOSTTY_CONFIG" | head -1 | sed 's/^/    /'
        echo ""
        echo "  To use Aurora Depths, replace it with:"
        echo "    $THEME_LINE"
        echo ""
    else
        info "Adding theme configuration to Ghostty config..."
        echo "" >> "$GHOSTTY_CONFIG"
        echo "# Aurora Depths 2026 Theme" >> "$GHOSTTY_CONFIG"
        echo "$THEME_LINE" >> "$GHOSTTY_CONFIG"
        success "Theme line added to config"
    fi
else
    info "Creating new Ghostty config with Aurora Depths theme..."
    cat > "$GHOSTTY_CONFIG" << EOF
# Ghostty Configuration
# Aurora Depths 2026 Theme
$THEME_LINE
EOF
    success "Created new Ghostty config"
fi

echo ""
success "Ghostty installation complete!"
echo ""
echo "  Theme installed to: $THEME_DEST"
echo "  Config location:    $GHOSTTY_CONFIG"
echo ""
echo "  Restart Ghostty to apply the theme."
echo ""
